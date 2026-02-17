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
        Schema::create('premiados', function (Blueprint $table) {
            $table->id('id_premiado');
            $table->unsignedBigInteger('id_premio')->nullable(false);
            $table->unsignedBigInteger('id_usuario')->nullable(false);
            $table->unsignedBigInteger('id_inscripcion')->nullable(false);
            $table->foreign('id_premio')->references('id_premio')->on('premios');
            $table->foreign('id_usuario')->references('id_usuario')->on('usuarios');
            $table->foreign('id_inscripcion')->references('id_inscripcion')->on('inscripciones_regalo');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('premiados');
    }
};