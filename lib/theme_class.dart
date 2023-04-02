
import 'package:flutter/material.dart';

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