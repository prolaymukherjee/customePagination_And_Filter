<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::post('/createProduct','ProductController@store');
Route::get('/getproduct','ProductController@getProduct');
Route::post('/deleteproduct/{id}','ProductController@deleteProduct');
Route::post('/editproduct/{Eid}','ProductController@updateProduct');
Route::post('/filterproduct/{p_id}','ProductController@filterProduct');
Route::get('/getcategory','ProductController@getCategory');