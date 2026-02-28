<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\GuiaRegalos;

class GuiaRegalosController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $guias = GuiaRegalos::all();

        return response()->json($guias);

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nombre' => 'required|string|max:150|unique:guia_regalos,nombre',
            'descripcion' => 'nullable|string|max:255'
        ]);

        $guia = GuiaRegalos::create([
            'nombre' => $validated['nombre'],
            'descripcion' => $validated['descripcion'] ?? null
        ]);

        return response()->json($guia, 201);
    } 

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $guia = GuiaRegalos::find($id);

        if (!$guia) {
            return response()->json([
                'message' => 'Guía de regalos no encontrada'
            ], 404);
        }

        return response()->json($guia);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $guia = GuiaRegalos::find($id);

        if (!$guia) {
            return response()->json([
                'message' => 'Guía de regalos no encontrada'
            ]);
        }

        $validated = $request->validate([
            'nombre' => 'sometimes|string|max:150|unique:guia_regalos,nombre,' . $id . ',id_guia',
            'descripcion' => 'nullable|string|max:255'
        ]);

        if (isset($validated['nombre'])) {
            $guia->nombre = $validated['nombre'];
        }

        if (array_key_exists('descripcion', $validated)) {
            $guia->descripcion = $validated['descripcion'];
        }
        $guia->update();

        return response()->json($guia);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $guia = GuiaRegalos::find($id);

        if (!$guia) {
            return response()->json([
                'message' => 'Guía de regalos no encontrada'
            ], 404);
        }

        $guia->delete();

        return response()->json([
            'message' => 'Guía de regalos eliminada correctamente'
        ]);
    }
}
