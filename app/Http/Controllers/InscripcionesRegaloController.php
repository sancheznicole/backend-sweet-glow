<?php

namespace App\Http\Controllers;

use App\Models\InscripcionRegalo;
use App\Models\FacturaPedidos;
use Illuminate\Http\Request;

class InscripcionesRegaloController extends Controller
{
    public function index()
    {
        return InscripcionRegalo::with(['usuario','factura'])->get();
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_usuario'        => 'required|exists:usuarios,id_usuario',
            'id_factura_pedido' => 'required|exists:factura_pedidos,id_factura_pedido'
        ]);

        // Verificar que la factura pertenece al usuario
        $facturaValida = FacturaPedidos::where('id_factura_pedido', $request->id_factura_pedido)
                            ->where('id_usuario', $request->id_usuario)
                            ->exists();

        if (!$facturaValida) {
            return response()->json([
                'message' => 'La factura no pertenece al usuario indicado.'
            ], 403);
        }

        // Verificar que la factura no haya sido usada ya en otra inscripción
        $facturaYaUsada = InscripcionRegalo::where('id_factura_pedido', $request->id_factura_pedido)
                            ->exists();

        if ($facturaYaUsada) {
            return response()->json([
                'message' => 'Esta factura ya fue utilizada en una inscripción anterior.'
            ], 422);
        }

        $inscripcion = InscripcionRegalo::create($request->all());

        return response()->json($inscripcion, 201);
    }

    public function show($id)
    {
        return InscripcionRegalo::with(['usuario','factura'])->findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $inscripcion = InscripcionRegalo::findOrFail($id);

        $inscripcion->update($request->all());

        return response()->json([
            "message" => "Inscripción actualizada correctamente"
        ]);
    }

    public function destroy($id)
    {
        $inscripcion = InscripcionRegalo::findOrFail($id);

        $inscripcion->delete();

        return response()->json([
            "message" => "Inscripción eliminada correctamente"
        ]);
    }

    // Retorna solo las facturas del usuario que aún no han sido usadas en una inscripción
    public function facturasPorUsuario($id_usuario)
    {
        // IDs de facturas que ya tienen inscripción
        $facturasUsadas = InscripcionRegalo::pluck('id_factura_pedido')->toArray();

        $facturas = FacturaPedidos::where('id_usuario', $id_usuario)
                        ->whereNotIn('id_factura_pedido', $facturasUsadas)
                        ->get();

        return response()->json($facturas);
    }
}