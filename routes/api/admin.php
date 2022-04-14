<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;


Route::post('/admin/login',[AuthController::class, 'adminLogin'])->name('adminLogin');
Route::group( ['prefix' => 'admin','middleware' => ['auth:admin-api','scopes:admin'] ],function(){
    // authenticated staff routes here
    Route::get('/dashboard',[AuthController::class, 'adminDashboard']);
});
