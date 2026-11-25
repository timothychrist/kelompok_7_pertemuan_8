import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';

InputDecoration appInputDecoration(String hint, IconData icon) => InputDecoration(
  hintText: hint, hintStyle: const TextStyle(fontSize: 11, color: Color(0xFFA5ADBA)),
  prefixIcon: Icon(icon, size: 17, color: muted), filled: true, fillColor: Colors.white,
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: line)),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: line)),
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: navy, width: 1.3)),
);
