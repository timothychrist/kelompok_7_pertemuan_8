import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';

class FieldLabel extends StatelessWidget {
  final String text; const FieldLabel(this.text);
  @override Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 7), child: Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: ink)));
}
