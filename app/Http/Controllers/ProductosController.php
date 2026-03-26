<?php

namespace App\Http\Controllers;

use App\Models\Productos;
use Illuminate\Http\Request;

class ProductosController extends Controller {
    
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request){
        $search = $request->search;
        
        $productos = Productos::with([
            'categoria',
            'marca',
            'referencia_producto',
            'guiaRegalo',
            'imagenes'
        ])->when($search, function ($query, $search) {
            $query->where('nombre', 'like', "%{$search}%")
                  ->orWhere('descripcion', 'like', "%{$search}%")
                  ->orWhere('stock', 'like', "%{$search}%")
                  ->orWhere('precio', 'like', "%{$search}%");
        })->paginate(5);

        return response()->json($productos);
    public function index(Request $request)
{
    $search = $request->search;

    $query = Productos::with([
        'categoria',
        'marca',
        'imagenes',
        'referencia_producto',
        'guiaRegalo'
    ]);

    // Búsqueda por texto
    if ($search) {
        $query->where(function($q) use ($search) {
            $q->where('nombre', 'like', "%{$search}%")
              ->orWhere('descripcion', 'like', "%{$search}%")
              ->orWhere('stock', 'like', "%{$search}%")
              ->orWhere('precio', 'like', "%{$search}%");
        });
    }

    // Filtros por categoría y marca
    if ($request->has('id_categoria')) {
        $query->where('id_categoria', $request->query('id_categoria'));
    }

    if ($request->has('id_marca')) {
        $query->where('id_marca', $request->query('id_marca'));
    }

    // Ordenamiento
    $orden = $request->query('orden', 'nombre_asc');
    switch ($orden) {
        case 'precio_asc':  $query->orderBy('precio', 'asc');  break;
        case 'precio_desc': $query->orderBy('precio', 'desc'); break;
        case 'nombre_desc': $query->orderBy('nombre', 'desc'); break;
        case 'fecha_desc':  $query->orderBy('created_at', 'desc'); break;
        case 'fecha_asc':   $query->orderBy('created_at', 'asc');  break;
        default:            $query->orderBy('nombre', 'asc');  break;
    }

    $limit = $request->query('limit', 5);

    return response()->json($query->paginate($limit));
}


    public function store(Request $request)
    {
        $validated = $request->validate([
            'nombre'  => 'required|string|max:100',
            'descripcion'  => 'required|string',
            'precio'  => 'required|numeric',
            'tendencia'  => 'required|boolean',
            'descuento'  => 'required|boolean',
            'prod_regalo'  => 'required|boolean',
            'premio'  => 'required|boolean',
            'stock' => 'required|integer',
            'id_categoria' => 'required|integer',
            'id_marca' => 'required|integer',
            'id_referencia' => 'required|integer',
            'id_guia' => 'nullable|integer',
        ]);

        $producto = Productos::create([
            'nombre' => $validated['nombre'],
            'descripcion' => $validated['descripcion'],
            'precio' => $validated['precio'],
            'tendencia' => $validated['tendencia'],
            'descuento' => $validated['descuento'],
            'prod_regalo' => $validated['prod_regalo'],
            'premio'  => $validated['premio'],
            'stock' => $validated['stock'],
            'id_categoria' => $validated['id_categoria'],
            'id_marca' => $validated['id_marca'],
            'id_referencia' => $validated['id_referencia'],
            'id_guia' => $validated['id_guia'] ?? null,
        ]);

        return response()->json([
            'message' => 'Producto creado correctamente',
            'data' => $producto
        ], 201);
    }

    public function show(string $id)
    {
        $producto = Productos::with([
            'categoria',
            'marca',
            'referencia_producto',
            'guiaRegalo',
            'imagenes'
        ])->find($id);

        if (!$producto) {
            return response()->json([
                'message' => 'Producto no encontrado'
            ], 404);
        }

        return response()->json($producto);
    }

    public function update(Request $request, string $id)
    {
        $producto = Productos::find($id);

        if (!$producto) {
            return response()->json([
                'message' => 'Producto no encontrado'
            ], 404);
        }

        $validated = $request->validate([
            'nombre'  => 'sometimes|string|max:100',
            'descripcion'  => 'sometimes|string',
            'precio'  => 'sometimes|numeric',
            'tendencia'  => 'sometimes|boolean',
            'descuento'  => 'sometimes|boolean',
            'prod_regalo'  => 'sometimes|boolean',
            'premio' => 'sometimes|boolean',
            'stock' => 'sometimes|integer',
            'id_categoria' => 'sometimes|integer',
            'id_marca' => 'sometimes|integer',
            'id_referencia' => 'sometimes|integer',
            'id_guia' => 'sometimes|nullable|integer',
        ]);

        if (isset($validated['nombre']))       $producto->nombre = $validated['nombre'];
        if (isset($validated['descripcion']))  $producto->descripcion = $validated['descripcion'];
        if (isset($validated['precio']))       $producto->precio = $validated['precio'];
        if (isset($validated['tendencia']))    $producto->tendencia = $validated['tendencia'];
        if (isset($validated['descuento']))    $producto->descuento = $validated['descuento'];
        if (isset($validated['prod_regalo'])) $producto->prod_regalo = $validated['prod_regalo'];
        if (isset($validated['premio']))       $producto->premio = $validated['premio'];
        if (isset($validated['stock']))        $producto->stock = $validated['stock'];
        if (isset($validated['id_categoria'])) $producto->id_categoria = $validated['id_categoria'];
        if (isset($validated['id_marca']))     $producto->id_marca = $validated['id_marca'];
        if (isset($validated['id_referencia'])) $producto->id_referencia = $validated['id_referencia'];
        if (isset($validated['id_guia']))      $producto->id_guia = $validated['id_guia'];

        $producto->update();

        return response()->json([
            'message' => 'Producto actualizado correctamente',
            'data' => $producto
        ], 200);
    }

    public function destroy(string $id)
    {
        $producto = Productos::find($id);

        if (!$producto) {
            return response()->json([
                'message' => 'Producto no encontrado'
            ], 404);
        }

        $producto->delete();

        return response()->json([
            'message' => 'Producto eliminado correctamente'
        ], 200);
    }
}