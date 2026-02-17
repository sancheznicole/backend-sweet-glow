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
        Schema::create('tarjetas_regalo', function (Blueprint $table) {
            $table->id('id_tarjeta');
            $table->decimal('monto', 10, 2)->nullable(false);
            $table->dateTime('fecha_creacion')->useCurrent()->nullable(false);
            $table->dateTime('fecha_expiracion')->nullable(false);
            $table->dateTime('fecha_de_uso')->nullable(false);
            $table->string('estado')->nullable(false);
            $table->unsignedBigInteger('id_usuario')->nullable(false);
            $table->foreign('id_usuario')->references('id_usuario')->on('usuarios');
            $table->timestamps();
        });
        DB::statement("ALTER TABLE tarjetas_regalo AUTO_INCREMENT = 1000;");
    }
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tarjetas_regalo');
    }
};
