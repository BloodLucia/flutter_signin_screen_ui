import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData light = ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,
    scaffoldBackgroundColor: HexColor('#FFFFFF'),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: HexColor('#F5F5F5'),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40).w,
        borderSide: const BorderSide(
          width: 0,
          color: Colors.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40).w,
        borderSide: const BorderSide(
          width: 0,
          color: Colors.transparent,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40).w,
        borderSide: const BorderSide(),
      ),
      hintStyle: TextStyle(
        color: HexColor('#333333'),
        fontSize: 42.sp,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 47,
        vertical: 49,
      ).r,
    ),
  );
}
