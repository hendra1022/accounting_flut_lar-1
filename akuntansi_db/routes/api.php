<?php

use App\Http\Controllers\CustomerTypeController;
use App\Http\Controllers\UserLoginController;
use Illuminate\Support\Facades\Route;


Route::controller(UserLoginController::class)->group(function () {
    Route::get('/user_login/id', 'coba_get');
    Route::resource('user_login', UserLoginController::class);
});

Route::controller(CustomerTypeController::class)->group(function () {
    // Route::get('/customer_type/id', 'coba_get');
    Route::get('/customer_type/filter', 'indexByParam');
    Route::resource('customer_type', CustomerTypeController::class);
});
