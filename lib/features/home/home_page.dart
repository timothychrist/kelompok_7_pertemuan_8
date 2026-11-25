import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/app_card.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/status_pill.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/top_bar.dart';
import 'package:kelompok_7_pertemuan_8/features/home/widgets/stat_card.dart';
import 'package:kelompok_7_pertemuan_8/features/home/widgets/mini_history_card.dart';
import 'package:kelompok_7_pertemuan_8/features/home/widgets/time_info.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onPresensi; final bool checkedIn, checkedOut;
  const HomePage({super.key, required this.onPresensi, required this.checkedIn, required this.checkedOut});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(18, 12, 18, 20), children: [
    const AppTopBar(),
    const SizedBox(height: 15),
    appCard(child: Row(children: [
      const CircleAvatar(radius: 22, backgroundColor: Color(0xFFE7EFFC), child: Icon(Icons.person, color: navy, size: 25)),
      const SizedBox(width: 11), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('☀️ Selamat Pagi,', style: TextStyle(fontSize: 11, color: muted)),
        SizedBox(height: 3), Text('Timothy Christopher', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: ink)),
        Text('Teknik Informatika • Universitas Esa Unggul', style: TextStyle(fontSize: 10, color: muted)),
      ])),
      Container(padding: const EdgeInsets.all(9), decoration: BoxDecoration(color: const Color(0xFFEEF2FF), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.badge_outlined, color: navy, size: 19)),
    ])),
    const SizedBox(height: 18),
    appCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(height: 4, decoration: const BoxDecoration(color: navy, borderRadius: BorderRadius.vertical(top: Radius.circular(12)))),
      const SizedBox(height: 12),
      const Row(children: [Icon(Icons.calendar_today, size: 13, color: muted), SizedBox(width: 7), Text('Senin, 10 Maret 2025', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: ink))]),
      const SizedBox(height: 9),
      const Row(children: [Text('Jam Kerja:', style: TextStyle(fontSize: 10, color: muted)), SizedBox(width: 8), Text('08:00 - 17:00 WIB', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: ink))]),
      const SizedBox(height: 12),
      Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFFF3FAFC), borderRadius: BorderRadius.circular(10)), child: Row(children: [
        Expanded(child: timeInfo('Waktu Masuk', checkedIn ? '07:54' : '--:--', Icons.login, green)),
        Container(width: 1, height: 40, color: line),
        Expanded(child: timeInfo('Waktu Pulang', checkedOut ? '17:02' : '--:--', Icons.logout, navy)),
      ])),
      const SizedBox(height: 8),
      Text(checkedIn ? '● Presensi masuk tercatat' : '● Valid via Geofence GPS', style: const TextStyle(fontSize: 9, color: green, fontWeight: FontWeight.w700)),
      const SizedBox(height: 12),
      SizedBox(width: double.infinity, child: FilledButton.icon(
        onPressed: onPresensi, icon: const Icon(Icons.how_to_reg, size: 17),
        label: Text(checkedOut ? 'Presensi Selesai' : checkedIn ? 'Presensi Pulang (Tersedia 17:00)' : 'Presensi Masuk'),
        style: FilledButton.styleFrom(backgroundColor: navy, minimumSize: const Size.fromHeight(43), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9))),
      )),
    ])),
    const SizedBox(height: 17),
    const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Ringkasan Bulan Ini (Maret)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: ink)), Text('21 Hari Kerja', style: TextStyle(fontSize: 9, color: muted))]),
    const SizedBox(height: 9),
    Row(children: const [
      Expanded(child: StatCard(title: 'Hadir', value: '18', unit: 'Hari', foot: '94.7% Laju', color: cyan, icon: Icons.check_circle)),
      SizedBox(width: 8), Expanded(child: StatCard(title: 'Terlambat', value: '1', unit: 'Hari', foot: '+8 Menit', color: orange, icon: Icons.schedule)),
      SizedBox(width: 8), Expanded(child: StatCard(title: 'Izin/Cuti', value: '0', unit: 'Hari', foot: 'Sisa Cuti: 12', color: blue, icon: Icons.event_available)),
    ]),
    const SizedBox(height: 13),
    appCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: const [Icon(Icons.apartment, color: navy, size: 17), SizedBox(width: 7), Expanded(child: Text('Kantor Utama Esa Unggul', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12, color: ink))), StatusPill('Aktif', green)]),
      const SizedBox(height: 8),
      const Text('Jl. Arjuna Utara No. 9, Kebon Jeruk, Jakarta Barat, DKI Jakarta 11510.', style: TextStyle(fontSize: 10, color: muted, height: 1.4)),
      const Divider(color: line, height: 18),
      const Row(children: [Icon(Icons.radar, size: 14, color: muted), SizedBox(width: 6), Text('Radius Validasi: 50 Meter', style: TextStyle(fontSize: 10, color: ink)), Spacer(), Icon(Icons.my_location, size: 14, color: green), SizedBox(width: 4), Text('Anda: 12m', style: TextStyle(fontSize: 10, color: green, fontWeight: FontWeight.w700))]),
    ])),
    const SizedBox(height: 15),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Riwayat Presensi Terbaru', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: ink)), TextButton(onPressed: onPresensi, child: const Text('Lihat Semua ›', style: TextStyle(fontSize: 10, color: navy)))]),
    const MiniHistoryCard(date: 'Jumat, 07 Mar 2025', time: '07:50', status: 'Hadir', color: cyan, out: '17:05'),
    const SizedBox(height: 7), const MiniHistoryCard(date: 'Kamis, 06 Mar 2025', time: '08:12', status: 'Terlambat', color: orange, out: '17:02'),
  ]);
}
