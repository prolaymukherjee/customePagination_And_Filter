<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
// protected $table = "products";
protected $guarded=[];

public function categories(){
return $this->belongsTo(Category::class,'cat_id');
  }
}