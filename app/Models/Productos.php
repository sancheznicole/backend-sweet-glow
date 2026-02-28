<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Productos extends Model
{
    use HasFactory;

    protected $table = 'productos';

    protected $primaryKey = 'id_producto';

    protected $fillable = [
            'nombre',
            'descripcion',
            'precio',
            'tendencia',
            'descuento',
            'prod_regalo',
            'premio',
            'stock',
            'id_categoria',
            'id_marca',
            'id_referencia',
            'id_guia'
    ];

    public function categoria()
    {
        return $this->belongsTo(Categorias::class, 'id_categoria', 'id_categoria');
    }

    public function marca()
    {
        return $this->belongsTo(Marcas::class, 'id_marca', 'id_marca');
    }

    public function referencia_producto(){
        return $this->belongsTo(ReferenciaProductos::class, 'id_referencia', 'id_referencia');
    }

    public function guiaRegalo()
    {
        return $this->belongsTo(GuiaRegalos::class, 'id_guia', 'id_guia');
    }
}
