// // // import 'dart:convert';
// // //
// // // Products productsFromMap(String str) => Products.fromMap(json.decode(str));
// // //
// // // String productsToMap(Products data) => json.encode(data.toMap());
// // //
// // // class Products {
// // //     Products({
// // //         required this.senderAddress,
// // //         required this.value,
// // //     });
// // //
// // //     String senderAddress;
// // //     double value;
// // //
// // //     factory Products.fromMap(Map<String, dynamic> json) => Products(
// // //         senderAddress: json["senderAddress"],
// // //         value: json["value"]?.toDouble(),
// // //     );
// // //
// // //     Map<String, dynamic> toMap() => {
// // //         "senderAddress": senderAddress,
// // //         "value": value,
// // //     };
// // // }
// //
// // import 'package:get/get.dart';
// //
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// //
// // class MyApp extends StatelessWidget {
// //   final passwordController = Get.put(PasswordController());
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GetMaterialApp(
// //       initialRoute: '/splash',
// //       getPages: [
// //         GetPage(name: '/splash', page: () => SplashPage()),
// //         GetPage(name: '/enter-password', page: () => EnterPasswordPage()),
// //         GetPage(name: '/home', page: () => HomePage()),
// //       ],
// //     );
// //   }
// // }
// // class PasswordController extends GetxController {
// //   bool hasPassword = false;
// //
// //   @override
// //   void onInit() async {
// //     super.onInit();
// //     var password = await getPasswordFromLocalStorage();
// //     hasPassword = password != null;
// //     if (hasPassword) {
// //       // Navigate to enter password screen
// //       Get.offNamed('/enter-password');
// //     } else {
// //       // Navigate to splash screen
// //       Get.offNamed('/splash');
// //     }
// //   }
// //
// //   Future<String?> getPasswordFromLocalStorage() async {
// //     // Get password from local storage
// //     // For example, using the shared_preferences package
// //     // Replace with your own implementation
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     return prefs.getString('password');
// //   }
// // }
// //
// // class SplashPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Text('Splash Screen'),
// //       ),
// //     );
// //   }
// // }
// //
// // class EnterPasswordPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Text('Enter Password Screen'),
// //       ),
// //     );
// //   }
// // }
// //
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Text('Home Screen'),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get_storage/get_storage.dart';
// //
// // void main() async {
// //   await GetStorage.init();
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   final storage = FlutterSecureStorage();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GetMaterialApp(
// //       title: 'Secure Storage Demo',
// //       initialRoute: '/',
// //       routes: {
// //         '/': (_) => SplashScreen(),
// //         '/home': (_) => HomeScreen(),
// //         '/setup': (_) => SetupScreen(),
// //       },
// //     );
// //   }
// // }
// class SplashScreen extends StatelessWidget {
//
//   final storage = FlutterSecureStorage();
//
//   Future<void> _checkPassword(BuildContext context) async {
//     final password = await storage.read(key: 'password');
//     if (password == null) {
//       // No password set, move to setup screen
//       Get.offAllNamed('/setup');
//     } else {
//       // Password set, move to login screen
//       while (true) {
//         final input = await _getPassword(context);
//         if (input == null) {
//           // User cancelled password input, do nothing
//           break;
//         } else if (input == password) {
//           Get.offAllNamed('/home');
//           break;
//         } else {
//           // Show error message if password is incorrect
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Incorrect password')),
//           );
//         }
//       }
//     }
//   }
//
//   Future<String?> _getPassword(BuildContext context) async {
//     return await showDialog<String>(
//       context: context,
//       builder: (_) => PasswordDialog(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _checkPassword(context);
//
//     return Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
//
// class SetupScreen extends StatelessWidget {
//   final storage = FlutterSecureStorage();
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController passwordController = TextEditingController();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Setup Password'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Please set a password to secure your data:',
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 final password = passwordController.text;
//                 if (password.isNotEmpty) {
//                   await storage.write(key: 'password', value: password);
//                   Get.offAllNamed('/home');
//                 }
//               },
//               child: Text('Set Password'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   final storage = FlutterSecureStorage();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: Text('Welcome to the Home Screen!'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await storage.deleteAll();
//           Get.offAllNamed('/');
//         },
//         child: Icon(Icons.logout),
//       ),
//     );
//   }
// }
//
// class PasswordDialog extends StatefulWidget {
//   const PasswordDialog({Key? key}) : super(key: key);
//
//   @override
//   _PasswordDialogState createState() => _PasswordDialogState();
// }
//
// class _PasswordDialogState extends State<PasswordDialog> {
//   final _controller = TextEditingController();
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Enter Password'),
//       content: TextField(
//         controller: _controller,
//         obscureText: true,
//         decoration: InputDecoration(
//           hintText: 'Password',
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context, null);
//           },
//           child: Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () {
//             final password = _controller.text.trim();
//             if (password.isNotEmpty) {
//               Navigator.pop(context, password);
//             }
//           },
//           child: Text('Ok'),
//         ),
//       ],
//     );
//   }
// }