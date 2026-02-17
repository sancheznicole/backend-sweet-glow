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
        Schema::table('productos', function (Blueprint $table) {
            $table->unsignedBigInteger('id_guia')->nullable()->after('id_referencia');

            $table->foreign('id_guia')->references('id_guia')->on('guia_regalos');
        });
    }

    public function down(): void
    {
        Schema::table('productos', function (Blueprint $table) {
            $table->dropForeign(['id_guia']);
            $table->dropColumn('id_guia');
        });
    }
};
