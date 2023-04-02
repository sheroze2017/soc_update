import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sbgwallet/Model/importAccount_model.dart';
import 'package:http/http.dart' as http;
import 'package:sbgwallet/Secret_Key.dart';
import 'package:sbgwallet/WalletPage_assets.dart';

class recoverAccount extends GetxController {
  var data = [].obs;
  final _storage = FlutterSecureStorage();

  var isLoading = true.obs;
  void fetch(phrase, String password) async {
    try {
      isLoading(true);
      await _storage.deleteAll();
      var _recoverdata = await recoverData(phrase);
      if (_recoverdata == null) {
        Get.snackbar('Error', 'No Account Exist');
      } else if (_recoverdata != null) {
        // _privateKey = dataTemp.privateKey;
        // _address = dataTemp.address;
        // privateKey = dataTemp.privateKey;
        // address = dataTemp.address;
        data.insert(0, _recoverdata.privateKey);
        data.insert(1, _recoverdata.address);
        data.insert(2, _recoverdata.encryptpk);
        data.insert(3, _recoverdata.balance);

        // data.add(dataTemp.privateKey);
        // data.add(dataTemp.address);

        Future.delayed(const Duration(milliseconds: 500), () async {
          // print(dataTemp.privateKey);
          // print(dataTemp.address);
          print(data[0]);
          print(data[1]);
          await _storage.write(key: 'listOfdata', value: jsonEncode(data));
          String? stringOfItems = await _storage.read(key: 'listOfdata');
          List<dynamic> listOfItems = await jsonDecode(stringOfItems!);
          print(listOfItems);
          // await _storage.delete(key: 'privatekey');
          // await _storage.delete(key: 'address');
          await _storage.write(key: 'privatekey', value: data[0].toString());
          await _storage.write(key: 'address', value: data[1].toString());
          await _storage.write(key: 'encryptpk', value: data[2].toString());
          await _storage.write(key: 'balance', value: data[3].toString());
          await _storage.write(key: 'password', value: password.toString());

          var address = await _storage.read(key: 'address');
          await Get.to(WalletPage_asset(),
              arguments: [phrase, data[1].toString(), data[0].toString()]);
          print(data.length);
        });
        print('successfull');
        // print(dataTemp.address.toString());
      }
    } finally {
      isLoading(false);
    }
  }
}

Future recoverData(String phrase) async {
  importwallet accountData;
  final response =
      await http.get(Uri.parse('http://localhost:8081/machimp?input=$phrase'));

  if (response.statusCode == 200) {
    print('sssss');
    accountData = await importwallet.fromJson(jsonDecode(response.body));
    print(accountData.privateKey);
    print(accountData.balance);
    print(accountData.encryptpk);
    print(accountData.address);
    //return response;
    //  print('!!!!!!!!!!!!!' + accountData.privateKey + 'asdadasdsad');
  } else {
    throw Exception('Failed to load album');
  }
  return accountData;
}
