import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sbgwallet/Model/accountimport_model.dart';
import 'package:sbgwallet/Secret_Key.dart';

class importAccount extends GetxController {
  var data = [].obs;
  final _storage = FlutterSecureStorage();

  var isLoading = true.obs;
  void fetch(PK) async {
    try {
      isLoading(true);
      var dataTemp = await fetchData(PK);
      if (dataTemp != null) {
        // _privateKey = dataTemp.privateKey;
        // _address = dataTemp.address;
        // privateKey = dataTemp.privateKey;
        // address = dataTemp.address;
        data.insert(0, dataTemp.privateKey);
        data.insert(1, dataTemp.address);

        // data.add(dataTemp.privateKey);
        // data.add(dataTemp.address);

        Future.delayed(const Duration(milliseconds: 500), () async {
          print(dataTemp.privateKey);
          print(dataTemp.address);
          print(data[0]);
          print(data[1]);
          await _storage.write(key: 'listOfdata', value: jsonEncode(data));
          String? stringOfItems = await _storage.read(key: 'listOfdata');
          List<dynamic> listOfItems = await jsonDecode(stringOfItems!);
          print('okdsd' + listOfItems[0] + 'feel goofd');
          await _storage.delete(key: 'privatekey');
          await _storage.delete(key: 'address');
          await _storage.write(key: 'privatekey', value: data[0].toString());
          await _storage.write(key: 'address', value: data[1].toString());
          var s = await _storage.read(key: 'address');
          print(s.toString());
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

Future fetchData(String PK) async {
  accountPK accountData;
  final response =
      await http.get(Uri.parse('http://localhost:8081/keyimport?key=$PK'));

  if (response.statusCode == 200) {
    accountData = await accountPK.fromJson(jsonDecode(response.body));
    // return response;
    //  print('!!!!!!!!!!!!!' + accountData.privateKey + 'asdadasdsad');
  } else {
    throw Exception('Failed to load album');
  }
  return accountData;
}
