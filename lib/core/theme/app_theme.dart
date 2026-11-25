import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: bg,
    colorScheme: ColorScheme.fromSeed(seedColor: navy, primary: navy),
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(backgroundColor: bg, foregroundColor: ink, elevation: 0),
  );
}
