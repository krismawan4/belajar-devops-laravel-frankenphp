<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\ProductController;


//route resource for products
Route::resource('/products', ProductController::class);

// default route to products index
Route::get('/', [ProductController::class, 'index']);
