import 'package:flutter/material.dart';

class ThemeProvider  extends ChangeNotifier{
     ThemeMode themeMode = ThemeMode.dark;

     bool get isDarkMode => themeMode == ThemeMode.dark;
}


class ThemeClass{
 
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff17E9E1),
     
      
    )
  );
 
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(),
      
      appBarTheme: AppBarTheme(
        
        backgroundColor: Color(0xff17E9E1),
      )
  );
}