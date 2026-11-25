import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';
import 'package:kelompok_7_pertemuan_8/core/utils/snackbar.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar();
  @override Widget build(BuildContext context) => Row(children: [
    const CircleAvatar(radius: 16, backgroundColor: Color(0xFFE7EFFC), child: Icon(Icons.apartment, size: 17, color: navy)),
    const SizedBox(width: 8), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('PresenTech', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: navy)), Text('Karyawan Portal', style: TextStyle(fontSize: 9, color: muted))])),
    IconButton(onPressed: () => showAppMessage(context, 'Tidak ada notifikasi baru.'), icon: const Icon(Icons.notifications_none, size: 21, color: ink)),
  ]);
}
