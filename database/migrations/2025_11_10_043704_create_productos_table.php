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
        Schema::create('productos', function (Blueprint $table) {
            $table->id('id_producto');
            $table->string('nombre')->nullable(false);
            $table->text('descripcion')->nullable(false);
            $table->decimal('precio', 10, 2)->nullable(false);
            $table->boolean('tendencia')->nullable(false);
            $table->boolean('descuento')->nullable(false);
            $table->boolean('prod_regalo')->nullable(false);
            $table->boolean('premio')->nullable(false);
            $table->integer('stock')->nullable(false);
            $table->unsignedBigInteger('id_categoria')->nullable(false);
            $table->unsignedBigInteger('id_marca')->nullable(false);
            $table->unsignedBigInteger('id_referencia')->unique()->nullable(false);
            $table->foreign('id_categoria')->references('id_categoria')->on('categorias');
            $table->foreign('id_marca')->references('id_marca')->on('marcas');
            $table->foreign('id_referencia')->references('id_referencia')->on('referencia_productos');
 
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('productos');
    }
};
