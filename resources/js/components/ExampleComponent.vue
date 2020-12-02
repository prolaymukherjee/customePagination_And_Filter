<template>
<div class="container" style="magin-top:25px;">

<div class="row justify-content-center">
<div class="col-md-8">
<div class="flex-center position-ref">
<p class="tet-center alert alert-danger" :class="{hidden:hasError}">
Please fill up All required Fill....
</p>
</div>

<div class="form-group">
<label for="exampleFormControlSelect1">Category</label>
<select class="form-control" v-model="newProduct.cat_id">

<option v-for="cat in category" :value="cat.id">{{ cat.name }}</option>

</select>
</div>

<div class="form-group">
<label for="exampleInputEmail1">Product Name</label>
<input type="text" class="form-control" aria-describedby="emailHelp"
placeholder="Enter name" v-model="newProduct.name">
</div>

<div class="form-group">
<label for="exampleInputEmail1">Price</label>
<input type="text" class="form-control" aria-describedby="emailHelp"
placeholder="Enter price" v-model="newProduct.price">
</div>


<button type="submit" class="btn btn-primary" @click="createProduct()">ADD</button>
<button class="btn btn-danger float-right" @click="refresh()">Refresh</button>

<div class="float-right fillter_part">
<label for="exampleInputEmail1">Filter By </label>

<select class="form-control" v-model="filter_cat_id"
@change="getProduct()">
<option value="asc">asc</option>
<option value="desc">desc</option>
</select>

</div>


<table class="table">
<thead>
<tr>
<th scope="col">#</th>

<th scope="col">Product Name</th>
<th scope="col">Category</th>
<th scope="col">Price</th>
<th scope="col">Action</th>
</tr>
</thead>
<tbody>
<tr v-for="(product,i) in products" :key="i">
<th scope="row">{{ i+1 }}</th>
<td>{{ product.name }}</td>
<td>{{ product.categories.name }}</td>
<td>{{ product.price }}</td>
<td>
<button class="btn btn-success btn-sm" @click="edit(product)">EDIT</button>
<button class="btn btn-danger btn-sm" @click=" deleteProduct(product)">DELETE</button>
</td>
</tr>

</tbody>
</table>

<pagination
:pagination="pagination"
:offset="5"
@paginate="getProduct()"
></pagination>

<div class="modal" tabindex="-1" role="dialog" aria-labelledby="showModalLabel" aria-hidden="true"
id="customerModalLong">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title">Modal title</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body">

<div class="form-group">
<label for="exampleFormControlSelect1">Category</label>
{{ editProductData.id }}
<select class="form-control" id="exampleFormControlSelect1"
v-model="editProductData.id">

<option v-for="cat in category" :value="cat.id">{{ cat.name }}</option>

</select>
</div>

<div class="form-group">
<label for="exampleInputEmail1">Product Name</label>
<input type="text" class="form-control" id="exampleInputEmail1"
aria-describedby="emailHelp" placeholder="Enter email"
v-model="editProductData.name">
</div>

<div class="form-group">
<label for="exampleInputEmail1">Price</label>
<input type="text" class="form-control" id="exampleInputEmail1"
aria-describedby="emailHelp" placeholder="Enter email"
v-model="editProductData.price">
</div>

</div>
<div class="modal-footer">
<button type="button" class="btn btn-primary" @click="update(editProductData)">Update
</button>
<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</template>

<script>
export default {

data() {
return {
newProduct: {'cat_id': '', 'name': '', 'price': ''},
hasError: true,
showModel: false,
editMode: false,
products: [],
category: [],
editProductData: [],
e_cat_id: '',
e_name: '',
e_price: '',
filter_cat_id: '',
pagination: 1,
filterBy: [
'asc', "desc"
]
}
},

mounted() {
this.getProduct();
this.getCategory();
},

methods: {
getCategory() {
let _this = this;
axios.get('/getcategory').then(function (response) {
_this.category = response.data;
console.log(_this.category);
});
},

getProduct() {
let _this = this;
let params = {
page: this.pagination != null ? this.pagination.current_page : 1,
filter: this.filter_cat_id

};
axios.get("/getproduct", {params: params}).then(function (response) {
_this.products = response.data.data;

console.log('df', _this.products)
_this.pagination = response.data;
console.log('pagination', _this.pagination)

});
},
createProduct() {
let input = this.newProduct;
let _this = this;
if (input['cat_id'] == '' || input['name'] == '' || input['price'] == '') {
this.hasError = false;
} else {
this.hasError = true;
axios.post('/createProduct', input).then(function (response) {

_this.newProduct = {'cat_id': '', 'name': '', 'price': ''}
_this.getProduct();

});
}


},

deleteProduct(product) {
let _this = this;
axios.post('/deleteproduct/' + product.id).then(function (response) {
_this.getProduct();
});
},

edit(product) {
let _this = this;
console.log('product', product)
this.editMode = true;
$("#customerModalLong").modal("show");
_this.editProductData = product;
},
update(val) {

console.log('j', this.editProductData.id)

// this.e_cat_id = this.editProductData.id;
// this.e_name = this.editProductData.name;
// this.e_price = this.editProductData.cat_id;


let input_fields = {
cat_id: this.editProductData.id,
name: this.editProductData.name,
price: this.editProductData.cat_id,
}
console.log('input_fields',input_fields)
axios.post('/editproduct/' + val.id, input_fields)
.then(function (response) {
$("#customerModalLong").modal("hide");
});

},
refresh() {
console.log('refresh');
let _this = this;
let params = {
page: 1,
filter: this.filter_cat_id
};
axios.get("/getproduct", {params: params}).then(function (response) {
_this.products = response.data.data;
_this.pagination = response.data;


});

}


}


}
</script>

