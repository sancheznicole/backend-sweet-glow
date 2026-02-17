<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Marcas extends Model
{
    use HasFactory;

    protected $table = 'marcas';
    protected $primaryKey = 'id_marca';

    protected $fillable = [
        'nombre',
        'pais_origen'
    ];

    // Relación: una marca tiene muchos productos
    public function productos()
    {
        return $this->hasMany(Producto::class, 'id_marca', 'id_marca');
    }
}
