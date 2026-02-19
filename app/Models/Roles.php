<?php

namespace App\Models;
use App\Models\Roles;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Roles extends Model
{
    use HasFactory;

    protected $primaryKey = 'id_rol';

    protected $fillable = ["nombre"];

    public function usuario()
    {  
        return $this->hasMany(Usuarios::class, 'id_rol', 'id_rol');
    }
}
