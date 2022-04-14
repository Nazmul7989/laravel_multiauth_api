<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;


Route::post('/user/login',[AuthController::class, 'userLogin'])->name('userLogin');

Route::group( ['prefix' => 'user','middleware' => ['auth:user-api','scopes:user'] ],function(){
    // authenticated staff routes here
    Route::get('/dashboard',[AuthController::class, 'userDashboard']);
});
