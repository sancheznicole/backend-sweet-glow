<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Resend;
use Exception;
use App\Models\Usuarios;
use App\Models\FacturaPedidos;

class EmailsController extends Controller
{
    public function sendElectronicBill(Request $request)
    {
        try {

            $id_factura = $request->id_factura;
            $status = $request->status;

            if(!isset($id_factura) || empty($id_factura)){
                return response()->json([
                    "message" => "Solicitud no procesable, datos insuficientes"
                ], 400);
            }

            $factura = FacturaPedidos::with(["usuario", "carrito.elementos.producto.imagenes", "carrito.elementos.producto.referencia_producto", "tarjeta"])->find($id_factura);

            if(!$factura){
                return response()->json([
                    "message" => "Factura no encontrada"
                ], 404);
            }

            $nombre = $factura->usuario->nombres." ".$factura->usuario->apellidos;
            $correo = $factura->usuario->correo;
            $total = (int)$factura->descuento > 0 ? ((int)$factura->neto - (int)$factura->descuento) : (int)$factura->neto;

            $productos = $factura->carrito->elementos;
            $email_productos = [];

            foreach($productos as $p){
                $email_productos[] = [
                    "nombre" => $p->producto->nombre,
                    "cantidad" => $p->cantidad,
                    "precio" => substr($p->price, 0, -3),
                    "imagen" => config('services.deploy.url_storage').$p->producto->imagenes[0]->filename ?? null,
                    "referencia" => $p->producto->referencia_producto->color." | ".$p->producto->referencia_producto->tamano
                ];
            }

            $html = view('emails.factura', [
                'nombre' => $nombre,
                'email' => $correo,
                'fecha' => now()->format('d/m/Y'),
                'productos' => $email_productos,
                'total' => $total
            ])->render();

            $resend = Resend::client(config('services.resend.key'));

            $resend->emails->send([
                'from' => config('services.resend.from'),
                'to' => $correo,
                'subject' => 'Factura electronica orden # '.$id_factura,
                'html' => $html
            ]);

            return response()->json([
                "message" => "Solicitud ejecutada correctamente"
            ], 200);

        } catch (Exception $e) {
            return response()->json([
                "message" => "Error al enviar correo",
                "error" => $e->getMessage()
            ], 500);
        }
    }
}