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
        Schema::create('factura_pedidos', function (Blueprint $table) {
            $table->id('id_factura_pedido');
            $table->decimal('neto', 10, 2)->nullable(false);
            $table->unsignedBigInteger('id_usuario')->nullable(false);
            $table->foreign('id_usuario')->references('id_usuario')->on('usuarios');
            $table->timestamps();
        });
        DB::statement("ALTER TABLE factura_pedidos AUTO_INCREMENT = 1000;");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('factura_pedidos');
    }
};
