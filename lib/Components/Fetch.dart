// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:sbgwallet/api.dart';
//
// import '../Token_nextpage.dart';
// import '../test_controller.dart';
// import '../text_api.dart';
// import 'Textfile.dart';
//
// class fetchData extends StatefulWidget {
//   const fetchData({super.key});
//
//   @override
//   State<fetchData> createState() => _fetchDataState();
// }
//
// class _fetchDataState extends State<fetchData> {
//   ProductController productController = Get.put(ProductController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: GetBuilder<ProductController >(builder: (controller){
//                      return Obx(() =>
//                       ListView.builder(
//                                        scrollDirection: Axis.vertical,
//                                       itemCount:productController.productList.length,
//                                       itemBuilder: (_, i){
//                                       var currentProduct = productController.productList[i];
//                        return GestureDetector(
//                          onTap: (){
//
//                         // Get.to(()=>Token_Next_Page(products:currentProduct));
//                         },
//
//                        child:  Column(
//                         children: [
//                           SizedBox(
//                             height: 2.h,
//                           ),
//
//                         Container(
//                           decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(10)
//                           ),
//                           child:  Row(children: [
//
//
//                                SizedBox(
//                                 width: 4.w,
//                                ),
//                                Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//
//                                   Textfile(
//                                   text: currentProduct.senderAddress,
//                                   textcolor: Colors.white,
//                                 // textcolor: isLightMode
//                                 // ? Colors.black
//                                 // : Colors.white,
//                                   textsize : 17.sp, textweight: FontWeight.bold),
//                                   Textfile(
//                                   text: "${currentProduct.value}",
//                                   textcolor: Colors.white,
//                                   // textcolor: isLightMode
//                                   // ? Colors.black
//                                   // : Colors.white,
//                                   textsize : 14.sp, textweight: FontWeight.normal),
//                                 ],
//                               ),
//                               ],)
//
//
//
//
//                         )
//
//                         ],
//                                        ),
//                        );
//                                       }
//
//                                       ),
//                      );
//                                     }),
//     );
//   }
// }