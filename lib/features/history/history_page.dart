import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/app_card.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/top_bar.dart';
import 'package:kelompok_7_pertemuan_8/core/utils/snackbar.dart';
import 'package:kelompok_7_pertemuan_8/features/history/widgets/summary_box.dart';
import 'package:kelompok_7_pertemuan_8/features/history/widgets/history_card.dart';

class HistoryPage extends StatelessWidget {
  final String filter; final ValueChanged<String> onFilter;
  const HistoryPage({super.key, required this.filter, required this.onFilter});
  @override Widget build(BuildContext context) {
    final records = [
      ('SEN','10','Senin, 10 Mar 2025','07:54 WIB','17:05 WIB','Hadir',cyan),
      ('JUM','07','Jumat, 07 Mar 2025','08:12 WIB','17:02 WIB','Terlambat 12 Menit',orange),
      ('KAM','06','Kamis, 06 Mar 2025','07:48 WIB','17:15 WIB','Hadir',cyan),
      ('RAB','05','Rabu, 05 Mar 2025','07:50 WIB','17:00 WIB','Tepat Waktu',cyan),
    ];
    final shown = records.where((r) => filter=='Semua' || (filter=='Hadir' && r.$6!='Terlambat 12 Menit') || (filter=='Terlambat' && r.$6=='Terlambat 12 Menit')).toList();
    return ListView(padding: const EdgeInsets.fromLTRB(18, 14, 18, 20), children: [
      const AppTopBar(),
      const SizedBox(height: 16),
      Row(children: [const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Riwayat Presensi', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: ink)), Text('Bab C.4 • Rekap Log Digital Karyawan', style: TextStyle(fontSize: 9, color: muted))])), OutlinedButton.icon(onPressed: () => showAppMessage(context, 'Riwayat siap diekspor setelah backend dihubungkan.'), icon: const Icon(Icons.download, size: 13), label: const Text('Export', style: TextStyle(fontSize: 10)), style: OutlinedButton.styleFrom(foregroundColor: navy, side: const BorderSide(color: line))) ]),
      const SizedBox(height: 12),
      appCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: const [Icon(Icons.calendar_month, size: 15, color: navy), SizedBox(width: 7), Text('Periode Presensi', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: ink)), Spacer(), Text('Maret 2025  ⌄', style: TextStyle(fontSize: 10, color: muted))]),
        const SizedBox(height: 12),
        Row(children: const [Expanded(child: SummaryBox(title:'Total Hadir', value:'20', unit:'Hari', color:Color(0xFFEAF7FA))), SizedBox(width:7), Expanded(child: SummaryBox(title:'Terlambat', value:'1', unit:'Hari', color:Color(0xFFFFF7E5))), SizedBox(width:7), Expanded(child: SummaryBox(title:'Kehadiran', value:'98%', unit:'Rasio', color:Color(0xFFEEF2FF)))]),
      ])),
      const SizedBox(height: 13),
      Wrap(spacing: 7, children: ['Semua','Hadir','Terlambat','Izin/Cuti'].map((v) => ChoiceChip(label: Text(v, style: TextStyle(fontSize: 10, color: filter==v?Colors.white:ink)), selected: filter==v, onSelected: (_) => onFilter(v), selectedColor: navy, backgroundColor: Colors.white, side: const BorderSide(color: line), showCheckmark: false, padding: const EdgeInsets.symmetric(horizontal: 6))).toList()),
      const SizedBox(height: 14),
      Row(children: [const Text('Catatan Riwayat Presensi', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: ink)), const Spacer(), Text('${shown.length} data terbaru', style: const TextStyle(fontSize: 9, color: muted))]),
      const SizedBox(height: 9),
      ...shown.map((r) => Padding(padding: const EdgeInsets.only(bottom: 9), child: HistoryCard(day:r.$1, number:r.$2, date:r.$3, checkIn:r.$4, checkOut:r.$5, status:r.$6, color:r.$7))),
      const SizedBox(height: 8),
      const Center(child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.verified_user, color: navy, size: 12), SizedBox(width: 5), Text('Terverifikasi Kriptografi GPS PresenTech v2.4', style: TextStyle(fontSize: 8, color: muted))])),
    ]);
  }
}
