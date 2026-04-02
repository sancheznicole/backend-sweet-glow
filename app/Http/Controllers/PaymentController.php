<?php

namespace App\Http\Controllers;

use MercadoPago\Client\Preference\PreferenceClient;
use MercadoPago\Client\Payment\PaymentClient;
use MercadoPago\Exceptions\MPApiException;
use MercadoPago\MercadoPagoConfig;
use App\Models\FacturaPedidos;
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
        
        $totalFinal = $total - $descuento;
        
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


    public function verify(Request $request)
    {
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
    }
}