<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\FacturaPedidos;

class DownloadsController extends Controller
{
    public function downloadPDF($id)
    {
        $factura = FacturaPedidos::with([
            'usuario',
            'carrito.elementos.producto.referencia_producto',
            'carrito.elementos.producto.imagenes',
            'carrito.elementos.producto.categoria',
            'carrito.elementos.producto.marca',
        ])->findOrFail($id);

        // return response()->json($factura);

        $pdf = Pdf::loadView('factura_pdf', compact('factura'));

        return $pdf->download("factura_{$id}.pdf");
    }
}
