// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import '../Model/Secret_Recovery_Phrase_Model.dart';
//
// class Secret_Recovery_Phrase_Controller extends GetxController{
//     var secret_recovery_phrase = <SecretRecoveryPhraseModel>[].obs;
//     var isDataLoadingCompleted = false.obs;
//
//     @override
//     void onInit(){
//       super.onInit();
//       fetchData();
//     }
//   void fetchData() async {
//       var srphrasejson = await rootBundle.loadString("lib/CreatePassword.json");
//       var decodeData = jsonDecode(srphrasejson);
//       print(decodeData);
//       secret_recovery_phrase.value = List.from(decodeData).map((e) =>  SecretRecoveryPhraseModel.fromMap(e)).toList();
//       isDataLoadingCompleted.value = true;
//
//       void destroy()
//       {
//         secret_recovery_phrase.value = [];
//       }
//   }
//
//
// }