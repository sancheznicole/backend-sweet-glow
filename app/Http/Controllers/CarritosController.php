<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Carritos;

class CarritosController extends Controller {
    
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request){
        $search = $request->search;
        $limit = $request->limit ?? 5;
        $carritos = Carritos::with([
            'usuario',
            "elementos"
        ])->when($search, function ($query, $search) {
            $query->where('id_carrito', '=', "{$search}")
            ->orWhereHas('usuario', function ($u) use ($search) {
                  $u->where('nombres', 'like', "%{$search}%")
                    ->orWhere('apellidos', 'like', "%{$search}%")
                    ->orWhere('correo', 'like', "%{$search}%")
                    ->orWhere('num_documento', 'like', "%{$search}%");
            });
        })->paginate($limit);

        return response()->json($carritos);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'id_usuario'  => 'required|integer',
            'status'  => 'required|string',
        ]);

        $carrito = Carritos::create([
            'id_usuario' => $validated['id_usuario'],
            'status' => $validated['status'],
        ]);

        return response()->json([
            'message' => 'Carrito creado correctamente',
            'data' => $carrito
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $carrito = Carritos::with([
            'usuario',
            "elementos"
        ])->find($id);

        if (!$carrito) {
            return response()->json([
                'message' => 'Carrito no encontrado'
            ], 404);
        }

        return response()->json($carrito);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $carrito = Carritos::find($id);

        if (!$carrito) {
            return response()->json([
                'message' => 'Carrito no encontrado'
            ], 404);
        }

        $validated = $request->validate([
            'id_usuario'  => 'sometimes|integer',
            'status'  => 'sometimes|string',
        ]);

        if (isset($validated['id_usuario']))     $carrito->id_usuario = $validated['id_usuario'];
        if (isset($validated['status']))     $carrito->status = $validated['status'];

        $carrito->update();

        return response()->json([
            'message' => 'Carrito actualizado correctamente',
            'data' => $carrito
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $carrito = Carritos::find($id);

        if (!$carrito) {
            return response()->json([
                'message' => 'Carrito no encontrado'
            ], 404);
        }

        $carrito->delete();

        return response()->json([
            'message' => 'Carrito eliminado correctamente'
        ], 200);
    }
}

