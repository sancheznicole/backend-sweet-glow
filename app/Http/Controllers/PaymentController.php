<?php

namespace App\Http\Controllers;

use MercadoPago\Client\Preference\PreferenceClient;
use MercadoPago\Client\Payment\PaymentClient;
use MercadoPago\Exceptions\MPApiException;
use MercadoPago\MercadoPagoConfig;
use App\Models\FacturaPedidos;
use App\Models\TarjetasRegalo;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function createPreference(Request $request)
    {
        MercadoPagoConfig::setAccessToken(config('services.mp.token'));

        $client = new PreferenceClient();

        $factura = FacturaPedidos::findOrFail($request->invoice_id);

        
        if ($factura->status === 'paid') {
            return response()->json([
                'error' => 'La factura ya fue pagada'
            ], 400);
        }

        
        $total = (float)$factura->neto;
        $descuento = (float)$factura->descuento;
        
        $totalFinal = max(0, $total - $descuento);

        if($totalFinal == 0){

            $factura->status = "paid";

            $id_tarjeta = $factura->id_tarjeta;

            $tarjeta = TarjetasRegalo::find($id_tarjeta);
            $tarjeta->estado = 'usada';

            $tarjeta->update();
            $factura->update();

            return response()->json([
                'successZeroPay' => 'Factura pago 0',
                "factura" => $request->invoice_id
            ], 200);

        }else{
            $items = [
                [
                    "title" => "Pago de factura #" . $factura->id_factura_pedido . " Sweet Glow",
                    "quantity" => 1,
                    "unit_price" => round($totalFinal, 2)
                ]
            ];

            try {
                $preference = $client->create([
                    "items" => $items,
                    "external_reference" => (string)$factura->id_factura_pedido,
                    "back_urls" => [
                        "success" => config('services.mp.return_url')."/success",
                        "failure" => config('services.mp.return_url')."/failure",
                        "pending" => config('services.mp.return_url')."/pending"
                    ],
                    "auto_return" => "approved",
                    'metadata' => [
                        'id_factura' => (string)$factura->id_factura_pedido
                    ]
                ]);

                return response()->json([
                    "init_point" => $preference->init_point
                ]);

            } catch (MPApiException $e) {

                return response()->json([
                    'error' => $e->getApiResponse()->getContent()
                ], 500);
            }
        }
    }

    public function createGiftCardsPreference(Request $request)
    {
        MercadoPagoConfig::setAccessToken(config('services.mp.token'));

        $client = new PreferenceClient();

        $giftcard = TarjetasRegalo::findOrFail($request->giftcardID);

        
        if ($giftcard->status === 'paid') {
            return response()->json([
                'error' => 'La tarjeta ya fue pagada'
            ], 400);
        }

        
        $total = (float)$giftcard->monto;

        $items = [
            [
                "title" => "Pago de tarjeta de regalo #" . $giftcard->id_tarjeta . " Sweet Glow",
                "quantity" => 1,
                "unit_price" => round($total, 2)
            ]
        ];

        try {
            $preference = $client->create([
                "items" => $items,
                "external_reference" => (string)$giftcard->id_tarjeta,
                "back_urls" => [
                    "success" => config('services.mp.return_url_giftcards')."/success",
                    "failure" => config('services.mp.return_url_giftcards')."/failure",
                    "pending" => config('services.mp.return_url_giftcards')."/pending"
                ],
                "auto_return" => "approved",
                'metadata' => [
                    'id_tarjeta' => (string)$giftcard->id_tarjeta
                ]
            ]);

            return response()->json([
                "init_point" => $preference->init_point
            ]);

        } catch (MPApiException $e) {

            return response()->json([
                'error' => $e->getApiResponse()->getContent()
            ], 500);
        }
    }

    public function paid_giftcard(Request $request){
        $id_tarjeta = $request->id_tarjeta;
        $mp_id = $request->payment_id;
        $mp_status = $request->mp_status;

        $giftcard = TarjetasRegalo::findOrFail($id_tarjeta);

        if($giftcard->status == "paid"){
            return response()->json([
                "Ya pagada"
            ], 200);
        }

        $giftcard->mp_status = $mp_status;
        $giftcard->mp_id = $mp_id;
        $giftcard->status = "paid";
        $giftcard->update();

        return response()->json([
            "success" => "Tarjeta de regalo actualizada con exito"
        ], 200);
    }


    public function verify(Request $request)
    {
        try{
            $payment_id = $request->payment_id;
            $id_factura = $request->factura;

            if(!$payment_id || !$id_factura){
                return response()->json(['message' => 'Datos incompletos'], 400);
            }

            MercadoPagoConfig::setAccessToken(config('services.mp.token'));

            $client = new PaymentClient();

            try {
                $payment = $client->get($payment_id);
            } catch (\Exception $e) {
                return response()->json([
                    'message' => 'Error consultando pago',
                    'error' => $e->getMessage()
                ], 500);
            }

            if(!$payment){
                return response()->json(['message' => 'Pago no encontrado'], 404);
            }

            $factura = FacturaPedidos::find($id_factura);

            if(!$factura){
                return response()->json(['message' => 'Factura no encontrada'], 404);
            }

            
            if($factura->status === "paid"){
                return response()->json([
                    "status" => "already_paid"
                ]);
            }

            // estado real del pago
            switch($payment->status){
                case "approved":
                    $factura->status = "paid";
                    break;

                case "pending":
                case "in_process":
                    $factura->status = "pending";
                    break;

                case "rejected":
                case "cancelled":
                    $factura->status = "failed";
                    break;
            }
            
            $factura->mp_status = $payment->status;
            $factura->mp_id = $payment_id;

            $factura->save();

            return response()->json([
                "status" => $payment->status
            ]);
        }catch (\Exception $e) {
            return response()->json([
                'message' => 'Error al procesa solicitud',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}