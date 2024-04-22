import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light, 
    textTheme: TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: Colors.black87, 
      ), 
      titleSmall: GoogleFonts.poppins(color: Colors.black54, 
      fontSize: 24), 
    )
    );

    // for dark mode.  
  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark, 
   textTheme: TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: Colors.white70, 
      ), 
      titleSmall: GoogleFonts.poppins(color: Colors.white60, 
      fontSize: 24), 
    )
  );
}
