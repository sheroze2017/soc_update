// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'Model/Test.dart';
// import 'api.dart';
//
// class ProductController extends GetxController{
//   var isLoading = true.obs;
//   var productList = <Products>[].obs;
// @override
// void onInit(){
//    fetchProducts();
//    super.onInit();
// }
// void fetchProducts() async {
//   try{
//     isLoading(true);
//     var products = await Api.fetchProducts();
//     if(products != null){
//       productList.value = products as List<Products>;
//
//     }
//   } finally{
//     isLoading(false);
//   }
// }
//
//
// }