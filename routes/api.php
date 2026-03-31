<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ImagenesController;

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post('/register', [AuthController::class, 'register'])->name('register');
    Route::post('/login', [AuthController::class, 'login'])->name('login');
    Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:api')->name('logout');
    Route::post('/refresh', [AuthController::class, 'refresh'])->middleware('auth:api')->name('refresh');
    Route::post('/me', [AuthController::class, 'me'])->middleware('auth:api')->name('me');
});

Route::apiResource('roles', App\Http\Controllers\RolesController::class);
Route::apiResource('users', App\Http\Controllers\UsuariosController::class);
Route::get('users/carts/{id}', [App\Http\Controllers\UsuariosController::class, 'findCarts']);

Route::apiResource('categories', App\Http\Controllers\CategoriasController::class);
Route::apiResource('brands', App\Http\Controllers\MarcasController::class);
Route::apiResource('product_references', App\Http\Controllers\ReferenciaProductosController::class);
Route::apiResource('gift_guide', App\Http\Controllers\GuiaRegalosController::class);
Route::get('products/tendency-latest', [App\Http\Controllers\ProductosController::class, 'tendency']);
Route::get('products/discount', [App\Http\Controllers\ProductosController::class, 'discount']);
Route::apiResource('products', App\Http\Controllers\ProductosController::class);
Route::apiResource('images', App\Http\Controllers\ImagenesController::class);
Route::apiResource('premios', App\Http\Controllers\PremioController::class);
Route::apiResource('premiados', App\Http\Controllers\PremiadosController::class);
Route::apiResource('gift_cards', App\Http\Controllers\TarjetasRegaloController::class);
Route::post('gift_cards/getOrSearch', [App\Http\Controllers\TarjetasRegaloController::class, 'getOrSearch']);
Route::post('gift_cards/{id}/usar', [App\Http\Controllers\TarjetasRegaloController::class, 'usar']);
Route::apiResource('order_invoice', App\Http\Controllers\FacturaPedidosController::class);
Route::apiResource('carts', App\Http\Controllers\CarritosController::class);
Route::apiResource('cart-elements', App\Http\Controllers\ElementosCarritosController::class);

// Ruta personalizada ANTES del resource para evitar conflictos
Route::get('gift_registrations/invoices-by-user/{id_usuario}', [App\Http\Controllers\InscripcionesRegaloController::class, 'facturasPorUsuario']);
Route::apiResource('gift_registrations', App\Http\Controllers\InscripcionesRegaloController::class);

Route::apiResource('reviews', App\Http\Controllers\ResenasController::class);
Route::get('reviews/product/{id}', [App\Http\Controllers\ResenasController::class, 'getByProduct']);

Route::post('/create-preference', [App\Http\Controllers\PaymentController::class, 'createPreference']);
Route::post('/webhook/mercadopago', [App\Http\Controllers\WebhookController::class, 'handle']);