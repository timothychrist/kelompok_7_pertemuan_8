import 'package:flutter/material.dart';

Widget appCard({required Widget child}) => Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFEAF0F3)), boxShadow: const [BoxShadow(color: Color(0x080E3155), blurRadius: 8, offset: Offset(0,2))]), child: child);
