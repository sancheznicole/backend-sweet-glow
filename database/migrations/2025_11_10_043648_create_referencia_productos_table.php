<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('referencia_productos', function (Blueprint $table) {
            $table->id('id_referencia');
            $table->string('codigo')->nullable(false);
            $table->string('color')->nullable(false);
            $table->string('tamaño')->nullable(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('referencia_productos');
    }
};
