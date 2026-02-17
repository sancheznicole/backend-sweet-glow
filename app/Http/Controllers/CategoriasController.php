<?php

namespace App\Http\Controllers;

use App\Models\Categorias;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class CategoriasController extends Controller
{
   // Listar todas las categorías
    public function index()
    {
        $categorias = Categorias::all();
        return response()->json($categorias, 200);
    }

    // Crear categoría
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nombre' => 'required|string|max:255|unique:categorias,nombre'
        ]);

        $categoria = Categorias::create($validated);

        return response()->json([
            'message' => 'Categoría creada correctamente',
            'data' => $categoria
        ], 201);
    }

    // Mostrar una categoría específica
    public function show($id)
    {
        $categoria = Categorias::find($id);

        if (!$categoria) {
            return response()->json([
                'message' => 'Categoría no encontrada'
            ], 404);
        }

        return response()->json($categoria, 200);
    }

    // Actualizar categoría
    public function update(Request $request, $id)
    {
        $categoria = Categorias::find($id);

        if (!$categoria) {
            return response()->json([
                'message' => 'Categoría no encontrada'
            ], 404);
        }

        $validated = $request->validate([
            'nombre' => [
                'required',
                'string',
                'max:255',
                Rule::unique('categorias', 'nombre')
                    ->ignore($categoria->id_categoria, 'id_categoria')
            ]
        ]);

        $categoria->update($validated);

        return response()->json([
            'message' => 'Categoría actualizada correctamente',
            'data' => $categoria->fresh()
        ], 200);
    }

    // Eliminar categoría
    public function destroy($id)
    {
        $categoria = Categorias::find($id);

        if (!$categoria) {
            return response()->json([
                'message' => 'Categoría no encontrada'
            ], 404);
        }

        $categoria->delete();

        return response()->json([
            'message' => 'Categoría eliminada correctamente'
        ], 200);
    }
}
