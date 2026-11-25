import 'package:flutter/material.dart';
import 'package:kelompok_7_pertemuan_8/core/constants/app_colors.dart';
import 'package:kelompok_7_pertemuan_8/core/theme/input_styles.dart';
import 'package:kelompok_7_pertemuan_8/shared/widgets/field_label.dart';
import 'package:kelompok_7_pertemuan_8/core/utils/snackbar.dart';
import 'package:kelompok_7_pertemuan_8/features/shell/main_shell.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController(text: '20240801254');
  final pass = TextEditingController();
  bool remember = false, obscure = true;
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(child: Center(child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 420), child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 34),
          Center(child: Container(width: 58, height: 58, decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.apartment_rounded, color: Colors.white, size: 30))),
          const SizedBox(height: 12),
          const Text('PresenTech', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: navy)),
          const SizedBox(height: 3),
          const Text('Workforce Time & Attendance System', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: muted)),
          const SizedBox(height: 48),
          const FieldLabel('Email / NIK Karyawan'),
          TextField(controller: email, decoration: appInputDecoration('Contoh: 20240801254 atau email@perusahaan', Icons.badge_outlined)),
          const SizedBox(height: 18),
          const FieldLabel('Kata Sandi'),
          TextField(controller: pass, obscureText: obscure, decoration: appInputDecoration('Masukkan kata sandi akun', Icons.lock_outline).copyWith(
            suffixIcon: IconButton(onPressed: () => setState(() => obscure = !obscure), icon: Icon(obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined, size: 19)),
          )),
          const SizedBox(height: 10),
          Row(children: [
            SizedBox(height: 28, child: Checkbox(value: remember, activeColor: navy, onChanged: (v) => setState(() => remember = v ?? false))),
            const Text('Ingat Saya', style: TextStyle(fontSize: 11, color: muted)),
            const Spacer(),
            TextButton(onPressed: () => showAppMessage(context, 'Hubungi administrator HR untuk reset kata sandi.'), child: const Text('Lupa Kata Sandi?', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: navy))),
          ]),
          const SizedBox(height: 12),
          FilledButton.icon(
            style: FilledButton.styleFrom(backgroundColor: navy, minimumSize: const Size.fromHeight(49), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainShell())),
            icon: const Icon(Icons.login_rounded, size: 18), label: const Text('Masuk ke PresenTech', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 18),
          const Row(children: [Expanded(child: Divider(color: line)), Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('ATAU', style: TextStyle(fontSize: 10, color: muted))), Expanded(child: Divider(color: line))]),
          const SizedBox(height: 18),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(backgroundColor: const Color(0xFFF4FAFB), side: const BorderSide(color: line), minimumSize: const Size.fromHeight(48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
            onPressed: () => showAppMessage(context, 'Fitur biometrik akan tersedia setelah autentikasi perangkat dikonfigurasi.'),
            icon: const Icon(Icons.fingerprint, color: navy), label: const Text('Masuk Cepat Biometrik', style: TextStyle(color: navy, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 70),
          Container(padding: const EdgeInsets.all(12), color: const Color(0xFFF7FAFC), child: const Column(children: [
            Text('Versi Aplikasi v1.0.0 • Universitas Esa Unggul Kelompok 7', textAlign: TextAlign.center, style: TextStyle(fontSize: 9, color: muted)),
            SizedBox(height: 4), Text('Hak Cipta Terlindungi © 2025 PresenTech Mobile Platform', style: TextStyle(fontSize: 8, color: muted)),
          ])),
        ],
      )),
    ))),
  );
}
