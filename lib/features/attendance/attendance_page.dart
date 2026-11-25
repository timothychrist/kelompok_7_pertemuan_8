import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/app_card.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/status_pill.dart';
import 'package:kelompok_7_pertemuan_8/core/theme/input_styles.dart';
import 'package:kelompok_7_pertemuan_8/features/attendance/widgets/geofence_map.dart';
import 'package:kelompok_7_pertemuan_8/features/attendance/widgets/data_chip.dart';
import 'package:kelompok_7_pertemuan_8/features/attendance/widgets/confirm_dialog.dart';

class AttendancePage extends StatefulWidget {
  final bool checkedIn, checkedOut; final VoidCallback onCheckIn, onCheckOut;
  const AttendancePage({super.key, required this.checkedIn, required this.checkedOut, required this.onCheckIn, required this.onCheckOut});
  @override State<AttendancePage> createState() => _AttendancePageState();
}
class _AttendancePageState extends State<AttendancePage> {
  final note = TextEditingController();
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(18, 12, 18, 22), children: [
    Row(children: [IconButton(onPressed: () => Navigator.of(context).maybePop(), icon: const Icon(Icons.arrow_back, size: 20)), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Presensi Geofencing', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: ink)), Text('PresenTech v2.4 • Modul Presensi C.3', style: TextStyle(fontSize: 9, color: muted))])), IconButton(onPressed: () => setState(() {}), icon: const Icon(Icons.refresh, size: 19, color: navy))]),
    appCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(children: [Icon(Icons.calendar_today, size: 13, color: muted), SizedBox(width: 7), Text('Senin, 24 Maret 2025', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: ink))]),
      const Text('Zona Waktu: Asia/Jakarta (WIB)', style: TextStyle(fontSize: 9, color: muted)),
      const SizedBox(height: 10),
      Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9), decoration: BoxDecoration(color: const Color(0xFFF1F5FF), borderRadius: BorderRadius.circular(9)), child: const Row(crossAxisAlignment: CrossAxisAlignment.end, children: [Text('20:31:00', style: TextStyle(fontSize: 27, color: navy, fontWeight: FontWeight.w800)), Padding(padding: EdgeInsets.only(bottom: 4, left: 4), child: Text('WIB', style: TextStyle(fontSize: 10, color: navy, fontWeight: FontWeight.w700)))])),
    ])),
    const SizedBox(height: 10),
    appCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const GeofenceMap(),
      const SizedBox(height: 12),
      const Row(children: [Icon(Icons.location_on, color: navy, size: 19), SizedBox(width: 7), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Gedung Utama Lt. 3, Kampus Esa Unggul', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: ink)), Text('Jl. Arjuna Utara No. 9, Kebon Jeruk, Jakarta Barat 11510', style: TextStyle(fontSize: 9, color: muted))]))]),
      const SizedBox(height: 12),
      Row(children: const [Expanded(child: DataChip(label: 'KOORDINAT LAT, LONG', value: '-6.198428, 106.782115')), SizedBox(width: 7), Expanded(child: DataChip(label: 'STATUS SENSOR GPS', value: 'High Accuracy (±4m', greenText: true))]),
    ])),
    const SizedBox(height: 10),
    appCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: const [Icon(Icons.access_time, size: 15, color: muted), SizedBox(width: 6), Text('Jadwal Shift Kerja', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: ink)), Spacer(), StatusPill('Sesuai Roster', green)]),
      const SizedBox(height: 9),
      Container(padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 12), decoration: BoxDecoration(border: Border.all(color: line), borderRadius: BorderRadius.circular(8)), child: const Row(children: [Text('Shift Reguler (08:00 - 17:00 WIB)', style: TextStyle(fontSize: 10, color: ink)), Spacer(), Icon(Icons.keyboard_arrow_down, size: 17, color: muted)])),
    ])),
    const SizedBox(height: 10),
    appCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(children: [Icon(Icons.note_alt_outlined, size: 15, color: navy), SizedBox(width: 6), Text('Catatan / Keterangan Kehadiran (Opsional)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: ink))]),
      const SizedBox(height: 5),
      const Text('Wajib diisi jika sedang penugasan WFH, dinas luar, atau izin terlambat.', style: TextStyle(fontSize: 9, color: muted)),
      const SizedBox(height: 8),
      TextField(controller: note, maxLines: 2, decoration: appInputDecoration('Tambah catatan jika WFH/dinas luar kota atau kendala...', Icons.edit_note).copyWith(prefixIcon: null)),
    ])),
    const SizedBox(height: 10),
    Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFFEAF1FF), borderRadius: BorderRadius.circular(10)), child: const Row(children: [Icon(Icons.verified_user_outlined, color: navy, size: 18), SizedBox(width: 8), Expanded(child: Text('Lokasi Anda telah diverifikasi aman oleh server PresenTech tanpa deteksi Mock Location (GPS Palsu).', style: TextStyle(fontSize: 9, color: navy, height: 1.35)))])),
    const SizedBox(height: 12),
    SizedBox(height: 46, child: FilledButton.icon(onPressed: widget.checkedIn ? null : () => showConfirmDialog(context, 'Check-In Masuk', widget.onCheckIn), icon: const Icon(Icons.login, size: 17), label: const Text('Check-In Masuk'), style: FilledButton.styleFrom(backgroundColor: navy, disabledBackgroundColor: const Color(0xFFBFC9E2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9))))),
    const SizedBox(height: 8),
    SizedBox(height: 44, child: OutlinedButton.icon(onPressed: (!widget.checkedIn || widget.checkedOut) ? null : () => showConfirmDialog(context, 'Check-Out Pulang', widget.onCheckOut), icon: const Icon(Icons.logout, size: 16), label: const Text('Check-Out Pulang (Aktif Pukul 17:00)'), style: OutlinedButton.styleFrom(foregroundColor: navy, side: const BorderSide(color: line), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9))))),
  ]);
}
