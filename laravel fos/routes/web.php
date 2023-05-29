<?php

use Illuminate\Support\Facades\Route;

Route::get('/admin', function () {
    return view('admin');
});
Route::get('/adendarenvios', function () {
    return view('agendarenvios');
});
Route::get('/domiciliosprinci', function () {
    return view('domiciliosprinci');
});
Route::get('/error500', function () {
    return view('error500');
});
Route::get('/index', function () {
    return view('index');
});
Route::get('/modificardom', function () {
    return view('modificardom');
});
Route::get('/registro', function () {
    return view('registro');
});
Route::get('/servicios', function () {
    return view('servicios');
});
Route::get('/verdomicilios', function () {
    return view('verdomicilios');
});
Route::get('/administrador', function () {
    return view('administrador');
});
Route::get('/contacto', function () {
    return view('contacto');

});
Route::get('/error404', function () {
    return view('error404');
});
Route::get('/formularioventas', function () {
    return view('formularioventas');
});
Route::get('/lading', function () {
    return view('lading');
});
Route::get('/recuperaremail', function () {
    return view('recuperaremail');
});
Route::get('/secion', function () {
    return view('secion');
});
Route::get('/ventas', function () {
    return view('ventas');
});
