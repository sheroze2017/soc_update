import 'dart:convert';


import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Model/Wallet_Model.dart';

class WalletController extends GetxController{
  var wallets = <WalletModel>[].obs;
  var isDataLoadingCompleted = false.obs;


  @override
  void onInit(){
    super.onInit();
    fetchData();
  }
  void fetchData() async{
    var walletjson = await rootBundle.loadString("lib/json/wallet.json");
    var decodeData = jsonDecode(walletjson);
    print (decodeData);
    wallets.value = List.from(decodeData).map((e) => WalletModel.fromMap(e)).toList();

    isDataLoadingCompleted.value = true;

  void destory()
  {
    wallets.value= [];
  }

 }
}