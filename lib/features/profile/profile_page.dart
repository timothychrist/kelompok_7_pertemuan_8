import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/app_card.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/status_pill.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/top_bar.dart';
import 'package:kelompok_7_pertemuan_8/features/profile/widgets/profile_row.dart';
import 'package:kelompok_7_pertemuan_8/features/auth/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(18, 14, 18, 24), children: [
    const AppTopBar(), const SizedBox(height: 22),
    appCard(child: Column(children: [
      const CircleAvatar(radius: 39, backgroundColor: Color(0xFFE6EEFF), child: Icon(Icons.person, color: navy, size: 42)),
      const SizedBox(height: 10), const Text('Timothy Christopher Suryadi', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: ink)),
      const SizedBox(height: 4), const Text('Karyawan • Teknik Informatika', style: TextStyle(fontSize: 11, color: muted)),
      const SizedBox(height: 12), const StatusPill('Akun Aktif', green),
    ])),
    const SizedBox(height: 17),
    const Text('Informasi Pengguna', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: ink)),
    const SizedBox(height: 9),
    appCard(child: const Column(children: [
      ProfileRow(icon: Icons.badge_outlined, label: 'Nomor Induk Karyawan', value: '20240801256'),
      Divider(color: line, height: 20), ProfileRow(icon: Icons.email_outlined, label: 'Email', value: 'timothy.suryadi@esaunggul.ac.id'),
      Divider(color: line, height: 20), ProfileRow(icon: Icons.apartment, label: 'Departemen', value: 'Teknik Informatika'),
      Divider(color: line, height: 20), ProfileRow(icon: Icons.work_outline, label: 'Jabatan', value: 'Staff / Mahasiswa'),
    ])),
    const SizedBox(height: 18),
    OutlinedButton.icon(onPressed: () => showDialog(context: context, builder: (ctx) => AlertDialog(title: const Text('Keluar dari akun?'), content: const Text('Anda akan kembali ke halaman login PresenTech.'), actions: [TextButton(onPressed:()=>Navigator.pop(ctx),child:const Text('Batal')), FilledButton(onPressed:(){Navigator.pop(ctx);Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:(_)=>const LoginPage()),(r)=>false);},child:const Text('Logout'))])), icon: const Icon(Icons.logout, size: 17), label: const Text('Logout'), style: OutlinedButton.styleFrom(foregroundColor: red, side: const BorderSide(color: Color(0xFFF0C8CC)), minimumSize: const Size.fromHeight(46))),
  ]);
}
