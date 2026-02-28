<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ReferenciaProductos extends Model
{
    use HasFactory;

    protected $table = 'referencia_productos';
    protected $primaryKey = 'id_referencia';

    protected $fillable = [
        'codigo',
        'color',
        'tamano'
    ];
}