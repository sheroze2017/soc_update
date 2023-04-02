import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sbgwallet/Components/Richtextfile.dart';
import 'package:sbgwallet/Components/Textfile.dart';
import 'package:sbgwallet/Dialog/Dialog_DepositETH.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Components/Tabbar_file.dart';
import 'Dialog/Dialog_Import_token.dart';
import 'Dialog/Dialog_Send.dart';
import 'Dialog/Dialog_myaccount.dart';
import 'Switch_button.dart';

class WalletPage_asset extends StatefulWidget {
  @override
  State<WalletPage_asset> createState() => _WalletPage_assetState();
}

class _WalletPage_assetState extends State<WalletPage_asset> {
  final _storage = FlutterSecureStorage();

  late SharedPreferences prefs;
  late String retrieve_address;
  late String retrieve_key;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    retrieve_address = prefs.getString('address') ?? 'default value';
    retrieve_key = prefs.getString('key') ?? 'default value';
    setState(() {});
  }

  // Future<void> saveValue(String value) async {
  //   await prefs.setString('myKey', value);
  //   setState(() {
  //     myValue = value;
  //   });
  // }

  List<String> items = [
    'Ethereum Mainnet',
    'BNB Smart Chain',
    'SBG Specail Network Powered by Flashbots',
    'Avalanche',
    'Polygon'
  ];
  String? selectedValue;
  double selectedBalance = 0.0;

  _WalletPage_assetState() {
    selectedValue =
        'Ethereum Mainnet'; // set the first item as selected by default
    selectedBalance =
        100.0; // set the balance of the first item as selected balance

    saveMyname('Ethereum MainNet');
    saveMyChainId('1');
    saveMyRpc('https://eth.llamarpc.com');
    saveMySymbol('ETH');
  }

  void onItemSelected(String? newValue) {
    setState(() {
      selectedValue = newValue;

      if (newValue == 'Ethereum Mainnet') {
        selectedBalance = 100.0;
        saveMyname('Ethereum MainNet');
        saveMyChainId('1');
        saveMyRpc('https://eth.llamarpc.com');
        saveMySymbol('ETH');
      } else if (newValue == 'BNB Smart Chain') {
        selectedBalance = 200.0;
        saveMyname('BNB Smart Chain');
        saveMyChainId('97');
        saveMyRpc('https://data-seed-prebsc-1-s1.binance.org:8545/');
        saveMySymbol('BNB');
      } else if (newValue == 'SBG Specail Network Powered by Flashbots') {
        selectedBalance = 300.0;
        saveMyname('SBG Specail Network Powered by Flashbots');
        saveMyChainId('1');
        saveMyRpc('https://rpc.flashbots.net');
        saveMySymbol('ETH');
      } else if (newValue == 'Avalanche') {
        selectedBalance = 400.0;
        saveMyname('Avalanche');
        saveMyChainId('43114');
        saveMyRpc('https://api.avax.network/ext/bc/C/rpc');
        saveMySymbol('AVAX');
      } else if (newValue == 'Polygon') {
        selectedBalance = 500.0;
        saveMyname('Polygon');
        saveMyChainId('137');
        saveMyRpc('https://polygon-rpc.com');
        saveMySymbol('MATIC');
      }
    });
  }

//  const WalletPage_asset({super.key});
  @override
  Widget build(BuildContext context) {
    final List<dynamic> arguments = Get.arguments;
    final String phrase = arguments[0];
    final String address = arguments[1];
    //var addstorage= _storage.read(key: 'address');

    //  var privatestorage= _storage.read(key: 'privatekey');
//String value = await _storage.read(key: key);

    final String private_key = arguments[2];
    // final isLightMode = Theme.of(context).brightness == Brightness.light;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate the appropriate height and width for the container
    final containerHeight = screenWidth * 0.09;
    final containerWidth = screenWidth * 0.35;

    // Calculate the appropriate padding based on the screen size
    //   final padding = screenWidth / 50;

    //final List<dynamic> arguments = Get.arguments;
    //final String phrase = arguments[0];
    // final String address = arguments[1];
    // final String private_key = arguments[2];

    //  final String address = "OXxcx9eA92cBOXxcx9eA92cB";
    //  final String phrase = "OXxcx9eA92cBOXxcx9eA92cB";
    // final String private_key = "OXxcx9eA92cBOXxcx9eA92cB";

    var padding = MediaQuery.of(context).size.width;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: padding / 12,
                left: padding / 20,
                right: padding / 20,
                bottom: padding / 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "Assets/Logo_white.png",
                      scale: 12,
                    ),
                    Row(
                      children: [
                        Switch_button(),
                        //DropdownFile(),

                        Container(
                          // width: containerHeight, // set the width of the container to limit the dropdown width
                          //height: containerWidth,
                          width:
                              130, // set the width of the container to limit the dropdown width
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          child: DropdownButton<String>(
                            elevation: 2,
                            value: selectedValue,
                            isExpanded:
                                true, // set isExpanded to true to fill the container width
                            items: items.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow
                                      .ellipsis, // handle text overflow with ellipsis
                                ),
                              );
                            }).toList(),
                            onChanged: onItemSelected,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Dialog_myaccount(
                            private_key: private_key, address: address),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Textfile(
                    text: "Account",
                    textcolor: isLightMode ? Colors.black : Colors.white,
                    textsize: 14.sp,
                    textweight: FontWeight.normal),
                SizedBox(
                  height: 0.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 1.8.h,
                        width: 22.w,
                        child: Text(
                          address,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: isLightMode ? Colors.black : Colors.white),
                        )

                        // Textfile(
                        //     text: address,
                        //     textcolor: isLightMode ? Colors.black : Colors.white,
                        //     textsize: 14.sp,
                        //     textweight: FontWeight.normal),
                        ),
                    GestureDetector(
                      onTap: () async {
                        Clipboard.setData(new ClipboardData(text: address))
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Copied to your clipboard !')));
                        });
                      },
                      child: Icon(
                        Icons.copy,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.2.h,
                ),
                Padding(
                  padding: EdgeInsets.all(padding / 20),
                  child: Container(
                    width: 50.h,
                    height: 155.w,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xff17E9E1), width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                        color: isLightMode ? Colors.white : Colors.black),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: padding / 100,
                          right: padding / 100,
                          top: padding / 100,
                          bottom: padding / 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Image.asset(
                            "Assets/wallet-icon.png",
                            scale: 6,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          // Text(
                          //   'Selected Balance: \$${selectedBalance.toStringAsFixed(2)}',
                          //   style: TextStyle(fontSize: 20),
                          // ),
                          Textfile(
                              text:
                                  'Selected Balance: \$${selectedBalance.toStringAsFixed(2)}',
                              textcolor:
                                  isLightMode ? Colors.black : Colors.white,
                              textsize: 15.sp,
                              textweight: FontWeight.bold),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DialogDeposit(),
                              SizedBox(
                                width: 1.h,
                              ),
                              Dialog_Send(),
                              SizedBox(
                                width: 1.h,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(child: Tabbarfile()),
                          ),
                          Textfile(
                              text: "Don't see your token?",
                              textcolor:
                                  isLightMode ? Colors.black : Colors.white,
                              textsize: 14.sp,
                              textweight: FontWeight.normal),
                          Dialog_Import_token(),
                        ],
                      ),
                    ),
                  ),
                ),
                Richtextfile(
                    text1: "Need Help? Contact",
                    text2: "SBG Wallet Support",
                    click: () {},
                    text1color: isLightMode ? Colors.black : Colors.white,
                    text2color: Colors.blue,
                    text1size: 13.sp,
                    text1weight: FontWeight.normal,
                    text2size: 13.sp,
                    text2weight: FontWeight.normal,
                    text1space: 1,
                    text2space: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> saveMyname(String name) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('name', name);
}

Future<void> saveMyChainId(String name) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('ChainId', name);
}

Future<void> saveMySymbol(String name) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('Symbol', name);
}

Future<void> saveMyRpc(String name) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('rpcUrl', name);
}
