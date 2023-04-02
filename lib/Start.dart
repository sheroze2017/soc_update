import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sbgwallet/Components/Richtextfile.dart';
import 'package:sbgwallet/WalletPage_assets.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'Terms_Screen.dart';
import 'Components/Textfile.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}
// bool _icon = false;

// IconData _Lighticon = Icons.wb_sunny;
// IconData _Darkicon  = Icons.nights_stay;

class _StartState extends State<Start> {
  bool isFinished = false;
  final storage = FlutterSecureStorage();

  Future<void> _checkPassword(BuildContext context) async {
    final password = await storage.read(key: 'password');
    if (password == null) {
      // No password set, move to setup screen
      Get.to(Start());
    } else {
      // final phrases = await storage.read(key: 'phrase');
      final address = await storage.read(key: 'address');
      final privatekey = await storage.read(key: 'privatekey');
      final String phrase = await '';

      Get.to(WalletPage_asset(), arguments: [phrase, address, privatekey]);
      // Password set, move to login screen
      // while (true) {

      //   final input = await _getPassword(context);
      //   if (input == null) {
      //     // User cancelled password input, do nothing
      //     break;
      //   } else if (input == password) {
      //         final phrases = await storage.read(key: 'phrase');
      //         final address = await storage.read(key: 'address');
      //         final privatekey = await storage.read(key: 'privatekey');

      //     Get.to(WalletPage_asset(), arguments: [phrases , address , privatekey]);
      //     break;
      //   } else {
      //     // Show error message if password is incorrect
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text('Incorrect password')),
      //     );
      //   }
      // }
    }
  }
//sheroze
  // Future<String?> _getPassword(BuildContext context) async {
  //   return await showDialog<String>(
  //     context: context,
  //     builder: (_) => PasswordDialog(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    _checkPassword(context);

    // final text = MediaQuery.of(context).platformBrightness == Brightness.dark
    //           ? 'DarkTheme'
    //           : 'LightTheme';
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    var padding = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Assets/background-min.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        // appBar: AppBar(
        //   leading:  IconButton(
        //     onPressed: (){
        //       Get.changeTheme(ThemeData.dark());
        //      // Get.isDarkMode ? ThemeData.light(): ThemeData.dark();
        //     },
        //    icon: Icon(Icons.abc),
        //     ),
        //     actions: [
        //       IconButton(
        //     onPressed: (){
        //       Get.changeTheme(ThemeData.light());
        //      // Get.isDarkMode ? ThemeData.light(): ThemeData.dark();
        //     },
        //    icon: Icon(Icons.abc),
        //     ),
        //     ],
        //   // actions: [
        //   //   IconButton(
        //   //   onPressed: (){
        //   //     Get.isDarkMode ? ThemeData.light(): ThemeData.dark();
        //   //   },
        //   //   icon: Icon(
        //   //     Get.isDarkMode ? Icons.dark_mode: Icons.dark_mode_outlined
        //   //   )
        //   //   )

        //   // ],
        // ),
        backgroundColor: Colors.black54,
        body: Padding(
          padding: EdgeInsets.only(
              top: padding / 12,
              left: padding / 20,
              right: padding / 20,
              bottom: padding / 20),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Image.asset(
                  "Assets/logo.png",
                  scale: 15,
                ),
                Textfile(
                  text: 'Welcome to SBG Wallet',
                  textcolor: Colors.white,
                  textsize: 22.sp,
                  textweight: FontWeight.bold,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: padding / 10),
                  child: Richtextfile(
                    text1: "Start Investing",
                    text2: "Today and your Future will change for the better",
                    click: () {},
                    text1color: Color(0xff17E9E1),
                    text2color: isLightMode ? Colors.white : Colors.white,
                    text1size: 16.sp,
                    text1weight: FontWeight.normal,
                    text2size: 16.sp,
                    text2weight: FontWeight.normal,
                    text1space: 1,
                    text2space: 2,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: padding / 20),
                  child: SizedBox(
                    height: 5.2.h,
                    width: 48.w,
                    child: SwipeableButtonView(
                      buttonText: "Let\'s Start",
                      buttontextstyle: TextStyle(color: Colors.black),
                      buttonWidget: Container(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                      ),
                      activeColor: Color(0xff17E9E1),
                      isFinished: isFinished,
                      onWaitingProcess: () {
                        Future.delayed(Duration(milliseconds: 3), () {
                          setState(() {
                            isFinished = true;
                          });
                        });
                      },
                      onFinish: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Terms_screen()),
                        );

                        //TODO: For reverse ripple effect animation
                        setState(() {
                          isFinished = false;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordDialog extends StatefulWidget {
  const PasswordDialog({Key? key}) : super(key: key);

  @override
  _PasswordDialogState createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    var padding = MediaQuery.of(context).size.width;

    return AlertDialog(
      title: Text('Enter Password'),
      content: TextField(
        controller: _controller,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
        ),
      ),
      actions: [
        // TextButton(
        //   onPressed: () {
        //     Navigator.pop(context, null);
        //   },
        //   child: Text('Cancel' , style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal , color: isLightMode ? Colors.black :Colors.white),),
        // ),
        TextButton(
          onPressed: () {
            final password = _controller.text.trim();
            if (password.isNotEmpty) {
              Navigator.pop(context, password);
            }
          },
          child: Text(
            'Ok',
            style: TextStyle(color: isLightMode ? Colors.black : Colors.white),
          ),
        ),
      ],
    );
  }
}
