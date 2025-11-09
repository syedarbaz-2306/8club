import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static const String fontFamily = 'Space Grotesk';

  // -------------------- HEADINGS --------------------

  TextStyle get h1Bold => GoogleFonts.spaceGrotesk(
        fontSize: 28,
        height: 32 / 28, // line-height ÷ font-size
        fontWeight: FontWeight.w600,
        letterSpacing: -0.03,
      );

  TextStyle get h1Regular => GoogleFonts.spaceGrotesk(
        fontSize: 28,
        height: 36 / 28,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.03,
      );

  TextStyle get h2Bold => GoogleFonts.spaceGrotesk(
        fontSize: 24,
        height: 30 / 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.02,
      );

  TextStyle get h2Regular => GoogleFonts.spaceGrotesk(
        fontSize: 24,
        height: 32 / 24,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.02,
      );

  TextStyle get h3Bold => GoogleFonts.spaceGrotesk(
        fontSize: 20,
        height: 26 / 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.01,
      );

  TextStyle get h3Regular => GoogleFonts.spaceGrotesk(
        fontSize: 20,
        height: 28 / 20,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.01,
      );

  // -------------------- BODY --------------------

  TextStyle get body1Bold => GoogleFonts.spaceGrotesk(
        fontSize: 18,
        height: 24 / 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
      );

  TextStyle get body1Regular => GoogleFonts.spaceGrotesk(
        fontSize: 18,
        height: 24 / 18,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      );

  TextStyle get body2Bold => GoogleFonts.spaceGrotesk(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
      );

  TextStyle get body2Regular => GoogleFonts.spaceGrotesk(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      );

  // -------------------- SUBTITLE --------------------

  TextStyle get subtitle1Bold => GoogleFonts.spaceGrotesk(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
      );

  TextStyle get subtitle1Regular => GoogleFonts.spaceGrotesk(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      );

  // -------------------- CAPTION --------------------

  TextStyle get caption => GoogleFonts.spaceGrotesk(
        fontSize: 10,
        height: 14 / 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
      );
}
