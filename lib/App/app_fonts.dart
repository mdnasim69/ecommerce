import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextTheme fontsTheme(){
    return TextTheme(
      titleLarge: GoogleFonts.sora(textStyle: TextStyle()),
      titleSmall: GoogleFonts.sora(textStyle: TextStyle()),
      titleMedium: GoogleFonts.sora(textStyle: TextStyle()),
      bodyLarge: GoogleFonts.sora(textStyle: TextStyle()),
      bodyMedium: GoogleFonts.sora(textStyle: TextStyle()),
      bodySmall: GoogleFonts.sora(textStyle: TextStyle()),
      headlineSmall: GoogleFonts.sora(textStyle: TextStyle()),
      headlineLarge: GoogleFonts.sora(textStyle: TextStyle()),
      headlineMedium: GoogleFonts.sora(textStyle: TextStyle()),
    );
  }
}
