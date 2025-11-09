
import 'package:flutter/material.dart';
import 'package:hotspot/styles/app_styles.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: $styles.colors.base2,
    appBarTheme: AppBarTheme(
      backgroundColor: $styles.colors.surfaceWhite1,
      centerTitle: false,
    ),
  );
}
