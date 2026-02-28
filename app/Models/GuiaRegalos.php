<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class GuiaRegalos extends Model
{
    use HasFactory;

    protected $table = 'guia_regalos';

    protected $primaryKey = 'id_guia';

    protected $fillable = ['nombre', 'descripcion'];
}