<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Category;

class ProductController extends Controller
{
public function store(Request $request){
$data = new Product();
$data->cat_id = $request->cat_id;
$data->name = $request->name;
$data->price = $request->price;
$data->save();

return $data;
}

public function getProduct(Request $request){

if($request->filter == 'asc'){
$data= Product::with('categories')->orderBy('id', 'ASC')->paginate(10);
}elseif($request->filter == 'desc'){
$data = Product::with('categories')->orderBy('id', 'DESC')->paginate(10);
}else{
$data = Product::with('categories')->paginate(10);
}
return $data;

}



public function deleteProduct(Request $request){

$data = Product::findOrFail($request->id);
$data->delete();
}

public function getCategory(){
$data = Category::all();
return $data;
}

public function updateProduct(Request $request,$id){


// return Product::findOrfail($id);
$data = Product::where('id',$id)->update([

'cat_id'=>$request->categories,
'name'=>$request->name,
'price'=>$request->price,
]);


return response()->json(['msg'=>'product updated successfully'],200);
}




}