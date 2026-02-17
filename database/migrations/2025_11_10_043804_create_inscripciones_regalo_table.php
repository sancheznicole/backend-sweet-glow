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
        Schema::create('inscripciones_regalo', function (Blueprint $table) {
            $table->id('id_inscripcion');
            $table->string('estado')->default('participando')->nullable(false);
            $table->unsignedBigInteger('id_usuario')->unique()->nullable(false);
            $table->unsignedBigInteger('id_factura_pedido')->nullable(false);
            $table->foreign('id_usuario')->references('id_usuario')->on('usuarios');
            $table->foreign('id_factura_pedido')->references('id_factura_pedido')->on('factura_pedidos');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('inscripciones_regalo');
    }
};
