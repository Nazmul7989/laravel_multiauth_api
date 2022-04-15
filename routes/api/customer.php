<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;


Route::post('/customer/login',[AuthController::class, 'userLogin'])->name('userLogin');

Route::group( ['prefix' => 'customer','middleware' => ['auth:customer-api'] ],function(){
    // authenticated staff routes here
    Route::get('/dashboard',[AuthController::class, 'userDashboard']);
});
