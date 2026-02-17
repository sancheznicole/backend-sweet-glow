<?php

namespace App\Http\Controllers;

use App\Models\Marcas;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class MarcasController extends Controller
{
    // Listar todas
    public function index()
    {
        return response()->json(Marcas::all(), 200);
    }

    // Crear
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nombre' => 'required|string|max:100|unique:marcas,nombre',
            'pais_origen' => 'required|string|max:100'
        ]);

        $marca = Marcas::create($validated);

        return response()->json([
            'message' => 'Marca creada correctamente',
            'data' => $marca
        ], 201);
    }

    // Mostrar una
    public function show($id)
    {
        $marca = Marcas::find($id);

        if (!$marca) {
            return response()->json([
                'message' => 'Marca no encontrada'
            ], 404);
        }

        return response()->json($marca, 200);
    }

    // Actualizar
    public function update(Request $request, $id)
    {
        $marca = Marcas::find($id);

        if (!$marca) {
            return response()->json([
                'message' => 'Marca no encontrada'
            ], 404);
        }

        $validated = $request->validate([
            'nombre' => [
                'sometimes',
                'string',
                'max:100',
                Rule::unique('marcas', 'nombre')
                    ->ignore($marca->id_marca, 'id_marca')
            ],
            'pais_origen' => 'sometimes|string|max:100'
        ]);

        $marca->update($validated);

        return response()->json([
            'message' => 'Marca actualizada correctamente',
            'data' => $marca->fresh()
        ], 200);
    }

    // Eliminar
    public function destroy($id)
    {
        $marca = Marcas::find($id);

        if (!$marca) {
            return response()->json([
                'message' => 'Marca no encontrada'
            ], 404);
        }

        $marca->delete();

        return response()->json([
            'message' => 'Marca eliminada correctamente'
        ], 200);
    }
}
