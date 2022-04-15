<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\BillController;



Route::post('/admin/login',[AuthController::class, 'adminLogin'])->name('adminLogin');

Route::group( ['prefix' => 'admin','middleware' => ['auth:admin-api'] ],function(){
    // authenticated staff routes here
    Route::get('/dashboard',[AuthController::class, 'adminDashboard']);

    //Customer route
    Route::get('/customer',[CustomerController::class,'index'])->name('customer.index');
    Route::post('/customer/store',[CustomerController::class,'store'])->name('customer.store');
    Route::post('/customer/update/{id}',[CustomerController::class,'update'])->name('customer.update');
    Route::delete('/customer/delete/{id}',[CustomerController::class,'destroy'])->name('customer.delete');

    //Billing route
    Route::get('/bill',[BillController::class,'index'])->name('bill.index');
    Route::post('/bill/store',[BillController::class,'store'])->name('bill.store');
    Route::post('/bill/update/{id}',[BillController::class,'update'])->name('bill.update');
    Route::delete('/bill/delete/{id}',[BillController::class,'destroy'])->name('bill.delete');



});
