import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';
import 'package:kelompok_7_pertemuan_8/core/utils/snackbar.dart';
import 'package:kelompok_7_pertemuan_8/features/home/home_page.dart';
import 'package:kelompok_7_pertemuan_8/features/attendance/attendance_page.dart';
import 'package:kelompok_7_pertemuan_8/features/history/history_page.dart';
import 'package:kelompok_7_pertemuan_8/features/profile/profile_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override State<MainShell> createState() => _MainShellState();
}
class _MainShellState extends State<MainShell> {
  int tab = 0;
  bool checkedIn = false, checkedOut = false;
  String historyFilter = 'Semua';
  final pages = <Widget>[];
  @override Widget build(BuildContext context) {
    final views = [
      HomePage(onPresensi: () => setState(() => tab = 1), checkedIn: checkedIn, checkedOut: checkedOut),
      AttendancePage(checkedIn: checkedIn, checkedOut: checkedOut, onCheckIn: _checkIn, onCheckOut: _checkOut),
      HistoryPage(filter: historyFilter, onFilter: (v) => setState(() => historyFilter = v)),
      const ProfilePage(),
    ];
    return Scaffold(
      body: SafeArea(child: IndexedStack(index: tab, children: views)),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: line))),
        child: NavigationBar(
          height: 68, selectedIndex: tab, backgroundColor: Colors.white, indicatorColor: const Color(0xFFE5EAFE),
          onDestinationSelected: (i) => setState(() => tab = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Beranda'),
            NavigationDestination(icon: Icon(Icons.location_on_outlined), selectedIcon: Icon(Icons.location_on), label: 'Presensi'),
            NavigationDestination(icon: Icon(Icons.history), selectedIcon: Icon(Icons.history_rounded), label: 'Riwayat'),
            NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }
  void _checkIn() { setState(() => checkedIn = true); showAppMessage(context, 'Check-in berhasil dicatat.'); }
  void _checkOut() { setState(() => checkedOut = true); showAppMessage(context, 'Check-out berhasil dicatat.'); }
}
