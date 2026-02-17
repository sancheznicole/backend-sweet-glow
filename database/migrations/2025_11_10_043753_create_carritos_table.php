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
        Schema::create('carritos', function (Blueprint $table) {
            $table->id('id_carrito');
            $table->integer('cantidad')->nullable(false);
            $table->decimal('descuento', 10, 2)->default(0);
            $table->unsignedBigInteger('id_producto')->nullable(false);
            $table->unsignedBigInteger('id_usuario')->nullable(false);
            $table->unsignedBigInteger('id_factura_pedido')->nullable(false);
            $table->unsignedBigInteger('id_tarjeta')->nullable;
            $table->foreign('id_producto')->references('id_producto')->on('productos');
            $table->foreign('id_usuario')->references('id_usuario')->on('usuarios');
            $table->foreign('id_factura_pedido')->references('id_factura_pedido')->on('factura_pedidos');
            $table->foreign('id_tarjeta')->references('id_tarjeta')->on('tarjetas_regalo');
            $table->timestamps();
        });
    }

    /** 
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('carritos');
    }
};
