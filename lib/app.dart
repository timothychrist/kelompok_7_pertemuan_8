import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/theme/app_theme.dart';
import 'package:kelompok_7_pertemuan_8/features/auth/login_page.dart';

class PresenTechApp extends StatelessWidget {
  const PresenTechApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'PresenTech',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light,
    home: const LoginPage(),
  );
}
