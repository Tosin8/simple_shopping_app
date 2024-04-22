import 'package:flutter/material.dart';

import 'text_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light, 
    textTheme:  ATextTheme.lightTextTheme , 
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    
    )), 
  ); 

  
    // for dark mode.  
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark, 
   textTheme: ATextTheme.darkTextTheme, 
  );
}
