<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Imagenes;

class ImagenesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $imagenes = Imagenes::all();

        return response()->json($imagenes);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'filename' => 'required|string',
            'id_producto' => 'required|exists:productos,id_producto'
        ]);

        $imagen = Imagenes::create($validated);

        return response()->json($imagen);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $imagen = Imagenes::find($id);

        if (!$imagen) {
            return response()->json([
                'message' => 'Imagen no encontrada'
            ], 404);
        }

        return response()->json($imagen);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $imagen = Imagenes::find($id);

        if (!$imagen) {
            return response()->json([
                'message' => 'Imagen no encontrada'
            ], 404);
        }

        $validated = $request->validate([
            'filename' => 'sometimes|string',
            'id_producto' => 'sometimes|exists:productos,id_producto'
        ]);

        if (isset($validated['filename']))
            $imagen->filename = $validated['filename'];

        if (isset($validated['id_producto']))
            $imagen->id_producto = $validated['id_producto'];

        $imagen->save();

        return response()->json($imagen);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $imagen = Imagenes::find($id);

        if (!$imagen) {
            return response()->json([
                'message' => 'Imagen no encontrada'
            ], 404);
        }

        $imagen->delete();

        return response()->json([
            'message' => 'Imagen eliminada correctamente'
        ]);
    }
}