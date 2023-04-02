import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sbgwallet/Recovery_Phrase.dart';
import 'package:sbgwallet/testing.dart';
import 'package:sbgwallet/theme_class.dart';
import 'Complete.dart';
import 'Model/Test.dart';
import 'Phrase.dart';
import 'Start.dart';
import 'Terms_Screen.dart';
import 'WalletPage_assets.dart';
import 'Secret_Key.dart';
import 'dark.dart';

Future<void> main() async {
  await GetStorage.init();
  // await dotenv.load(
  //   fileName: '.env',
  // );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  // dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

bool _icon = false;

IconData _Lighticon = Icons.wb_sunny;
IconData _Darkicon = Icons.nights_stay;

class _MyAppState extends State<MyApp> {
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SBG WALLET',
          //  themeMode:ThemeMode.system,
          //  theme: ThemeClass.lightTheme ,
// darkTheme: ThemeClass.darkTheme,
// themeMode: ThemeMode.system,
          // darkTheme:ThemeClass.darkTheme,
          theme: _icon ? ThemeClass.lightTheme : ThemeClass.darkTheme,
          darkTheme: ThemeClass.darkTheme,
          //theme: _icon ? _DarkTheme: _LightTheme,

//          Theme.of(context).copyWith(
//          scaffoldBackgroundColor: Color(0xffF5FAFA),
//         colorScheme: Theme.of(context).colorScheme.copyWith(
//         primary:  Colors.black,

//       ),
// ),
          // home: Recovery_Phrase(),

          initialRoute: '/',
          routes: {
            //   '/1': (_) => Recovery_Phrase(),
            '/': (_) => Start(),
            '/home': (_) => WalletPage_asset(),
          });
      //   home: MyApp());
    });
  }
}
