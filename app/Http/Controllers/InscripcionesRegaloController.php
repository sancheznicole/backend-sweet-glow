<?php

namespace App\Http\Controllers;

use App\Models\InscripcionRegalo;
use Illuminate\Http\Request;

class InscripcionesRegaloController extends Controller
{
public function index(Request $request)
{
    $limit = $request->query('limit', 10);
    $limit = min(max(1, (int)$limit), 100);

    $inscripciones = InscripcionRegalo::with(['usuario', 'factura'])
        ->paginate($limit);

    return response()->json([
        'valid'        => true,
        'data'         => $inscripciones->items(),
        'current_page' => $inscripciones->currentPage(),
        'last_page'    => $inscripciones->lastPage(),
        'per_page'     => $inscripciones->perPage(),
        'total'        => $inscripciones->total()
    ]);
}
    public function store(Request $request)
    {
        $request->validate([
            'id_usuario' => 'required|exists:usuarios,id_usuario|unique:inscripciones_regalo,id_usuario',
            'id_factura_pedido' => 'required|exists:factura_pedidos,id_factura_pedido'
        ]);

        $inscripcion = InscripcionRegalo::create($request->all());

        return response()->json($inscripcion,201);
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
}