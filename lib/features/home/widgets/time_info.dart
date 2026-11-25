import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';

Widget timeInfo(String label, String time, IconData icon, Color color) => Padding(padding: const EdgeInsets.symmetric(horizontal: 5), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  Text(label, style: const TextStyle(fontSize: 9, color: muted)), const SizedBox(height: 5),
  Row(children: [Icon(icon, color: color, size: 13), const SizedBox(width: 5), Text(time, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: ink)), const Text(' WIB', style: TextStyle(fontSize: 8, color: muted))]),
]));
