
import 'package:flutter/material.dart';

void main() => runApp(const PresenTechApp());

const navy = Color(0xFF183AA6);
const blue = Color(0xFF2449B8);
const cyan = Color(0xFF35B9D8);
const bg = Color(0xFFF2FAFA);
const ink = Color(0xFF17233D);
const muted = Color(0xFF7C8799);
const line = Color(0xFFE5EAF1);
const green = Color(0xFF16A58A);
const orange = Color(0xFFE6A12A);
const red = Color(0xFFD94C59);

class PresenTechApp extends StatelessWidget {
  const PresenTechApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'PresenTech',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(seedColor: navy, primary: navy),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(backgroundColor: bg, foregroundColor: ink, elevation: 0),
    ),
    home: const LoginPage(),
  );
}

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
          const _FieldLabel('Email / NIK Karyawan'),
          TextField(controller: email, decoration: _inputDecoration('Contoh: 20240801254 atau email@perusahaan', Icons.badge_outlined)),
          const SizedBox(height: 18),
          const _FieldLabel('Kata Sandi'),
          TextField(controller: pass, obscureText: obscure, decoration: _inputDecoration('Masukkan kata sandi akun', Icons.lock_outline).copyWith(
            suffixIcon: IconButton(onPressed: () => setState(() => obscure = !obscure), icon: Icon(obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined, size: 19)),
          )),
          const SizedBox(height: 10),
          Row(children: [
            SizedBox(height: 28, child: Checkbox(value: remember, activeColor: navy, onChanged: (v) => setState(() => remember = v ?? false))),
            const Text('Ingat Saya', style: TextStyle(fontSize: 11, color: muted)),
            const Spacer(),
            TextButton(onPressed: () => _message(context, 'Hubungi administrator HR untuk reset kata sandi.'), child: const Text('Lupa Kata Sandi?', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: navy))),
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
            onPressed: () => _message(context, 'Fitur biometrik akan tersedia setelah autentikasi perangkat dikonfigurasi.'),
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

InputDecoration _inputDecoration(String hint, IconData icon) => InputDecoration(
  hintText: hint, hintStyle: const TextStyle(fontSize: 11, color: Color(0xFFA5ADBA)),
  prefixIcon: Icon(icon, size: 17, color: muted), filled: true, fillColor: Colors.white,
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: line)),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: line)),
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: navy, width: 1.3)),
);

class _FieldLabel extends StatelessWidget {
  final String text; const _FieldLabel(this.text);
  @override Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(bottom: 7), child: Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: ink)));
}

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
  void _checkIn() { setState(() => checkedIn = true); _message(context, 'Check-in berhasil dicatat.'); }
  void _checkOut() { setState(() => checkedOut = true); _message(context, 'Check-out berhasil dicatat.'); }
}

class HomePage extends StatelessWidget {
  final VoidCallback onPresensi; final bool checkedIn, checkedOut;
  const HomePage({super.key, required this.onPresensi, required this.checkedIn, required this.checkedOut});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(18, 12, 18, 20), children: [
    const _TopBar(),
    const SizedBox(height: 15),
    _card(child: Row(children: [
      const CircleAvatar(radius: 22, backgroundColor: Color(0xFFE7EFFC), child: Icon(Icons.person, color: navy, size: 25)),
      const SizedBox(width: 11), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('☀️ Selamat Pagi,', style: TextStyle(fontSize: 11, color: muted)),
        SizedBox(height: 3), Text('Timothy Christopher', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: ink)),
        Text('Teknik Informatika • Universitas Esa Unggul', style: TextStyle(fontSize: 10, color: muted)),
      ])),
      Container(padding: const EdgeInsets.all(9), decoration: BoxDecoration(color: const Color(0xFFEEF2FF), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.badge_outlined, color: navy, size: 19)),
    ])),
    const SizedBox(height: 18),
    _card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(height: 4, decoration: const BoxDecoration(color: navy, borderRadius: BorderRadius.vertical(top: Radius.circular(12)))),
      const SizedBox(height: 12),
      const Row(children: [Icon(Icons.calendar_today, size: 13, color: muted), SizedBox(width: 7), Text('Senin, 10 Maret 2025', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: ink))]),
      const SizedBox(height: 9),
      const Row(children: [Text('Jam Kerja:', style: TextStyle(fontSize: 10, color: muted)), SizedBox(width: 8), Text('08:00 - 17:00 WIB', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: ink))]),
      const SizedBox(height: 12),
      Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFFF3FAFC), borderRadius: BorderRadius.circular(10)), child: Row(children: [
        Expanded(child: _timeInfo('Waktu Masuk', checkedIn ? '07:54' : '--:--', Icons.login, green)),
        Container(width: 1, height: 40, color: line),
        Expanded(child: _timeInfo('Waktu Pulang', checkedOut ? '17:02' : '--:--', Icons.logout, navy)),
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
      Expanded(child: _StatCard(title: 'Hadir', value: '18', unit: 'Hari', foot: '94.7% Laju', color: cyan, icon: Icons.check_circle)),
      SizedBox(width: 8), Expanded(child: _StatCard(title: 'Terlambat', value: '1', unit: 'Hari', foot: '+8 Menit', color: orange, icon: Icons.schedule)),
      SizedBox(width: 8), Expanded(child: _StatCard(title: 'Izin/Cuti', value: '0', unit: 'Hari', foot: 'Sisa Cuti: 12', color: blue, icon: Icons.event_available)),
    ]),
    const SizedBox(height: 13),
    _card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: const [Icon(Icons.apartment, color: navy, size: 17), SizedBox(width: 7), Expanded(child: Text('Kantor Utama Esa Unggul', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12, color: ink))), _Pill('Aktif', green)]),
      const SizedBox(height: 8),
      const Text('Jl. Arjuna Utara No. 9, Kebon Jeruk, Jakarta Barat, DKI Jakarta 11510.', style: TextStyle(fontSize: 10, color: muted, height: 1.4)),
      const Divider(color: line, height: 18),
      const Row(children: [Icon(Icons.radar, size: 14, color: muted), SizedBox(width: 6), Text('Radius Validasi: 50 Meter', style: TextStyle(fontSize: 10, color: ink)), Spacer(), Icon(Icons.my_location, size: 14, color: green), SizedBox(width: 4), Text('Anda: 12m', style: TextStyle(fontSize: 10, color: green, fontWeight: FontWeight.w700))]),
    ])),
    const SizedBox(height: 15),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Riwayat Presensi Terbaru', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: ink)), TextButton(onPressed: onPresensi, child: const Text('Lihat Semua ›', style: TextStyle(fontSize: 10, color: navy)))]),
    const _MiniHistory(date: 'Jumat, 07 Mar 2025', time: '07:50', status: 'Hadir', color: cyan, out: '17:05'),
    const SizedBox(height: 7), const _MiniHistory(date: 'Kamis, 06 Mar 2025', time: '08:12', status: 'Terlambat', color: orange, out: '17:02'),
  ]);
}

Widget _timeInfo(String label, String time, IconData icon, Color color) => Padding(padding: const EdgeInsets.symmetric(horizontal: 5), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  Text(label, style: const TextStyle(fontSize: 9, color: muted)), const SizedBox(height: 5),
  Row(children: [Icon(icon, color: color, size: 13), const SizedBox(width: 5), Text(time, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: ink)), const Text(' WIB', style: TextStyle(fontSize: 8, color: muted))]),
]));

class AttendancePage extends StatefulWidget {
  final bool checkedIn, checkedOut; final VoidCallback onCheckIn, onCheckOut;
  const AttendancePage({super.key, required this.checkedIn, required this.checkedOut, required this.onCheckIn, required this.onCheckOut});
  @override State<AttendancePage> createState() => _AttendancePageState();
}
class _AttendancePageState extends State<AttendancePage> {
  final note = TextEditingController();
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(18, 12, 18, 22), children: [
    Row(children: [IconButton(onPressed: () => Navigator.of(context).maybePop(), icon: const Icon(Icons.arrow_back, size: 20)), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Presensi Geofencing', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: ink)), Text('PresenTech v2.4 • Modul Presensi C.3', style: TextStyle(fontSize: 9, color: muted))])), IconButton(onPressed: () => setState(() {}), icon: const Icon(Icons.refresh, size: 19, color: navy))]),
    _card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(children: [Icon(Icons.calendar_today, size: 13, color: muted), SizedBox(width: 7), Text('Senin, 24 Maret 2025', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: ink))]),
      const Text('Zona Waktu: Asia/Jakarta (WIB)', style: TextStyle(fontSize: 9, color: muted)),
      const SizedBox(height: 10),
      Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9), decoration: BoxDecoration(color: const Color(0xFFF1F5FF), borderRadius: BorderRadius.circular(9)), child: const Row(crossAxisAlignment: CrossAxisAlignment.end, children: [Text('20:31:00', style: TextStyle(fontSize: 27, color: navy, fontWeight: FontWeight.w800)), Padding(padding: EdgeInsets.only(bottom: 4, left: 4), child: Text('WIB', style: TextStyle(fontSize: 10, color: navy, fontWeight: FontWeight.w700)))])),
    ])),
    const SizedBox(height: 10),
    _card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const _GeofenceMap(),
      const SizedBox(height: 12),
      const Row(children: [Icon(Icons.location_on, color: navy, size: 19), SizedBox(width: 7), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Gedung Utama Lt. 3, Kampus Esa Unggul', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: ink)), Text('Jl. Arjuna Utara No. 9, Kebon Jeruk, Jakarta Barat 11510', style: TextStyle(fontSize: 9, color: muted))]))]),
      const SizedBox(height: 12),
      Row(children: const [Expanded(child: _DataChip(label: 'KOORDINAT LAT, LONG', value: '-6.198428, 106.782115')), SizedBox(width: 7), Expanded(child: _DataChip(label: 'STATUS SENSOR GPS', value: 'High Accuracy (±4m', greenText: true))]),
    ])),
    const SizedBox(height: 10),
    _card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: const [Icon(Icons.access_time, size: 15, color: muted), SizedBox(width: 6), Text('Jadwal Shift Kerja', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: ink)), Spacer(), _Pill('Sesuai Roster', green)]),
      const SizedBox(height: 9),
      Container(padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 12), decoration: BoxDecoration(border: Border.all(color: line), borderRadius: BorderRadius.circular(8)), child: const Row(children: [Text('Shift Reguler (08:00 - 17:00 WIB)', style: TextStyle(fontSize: 10, color: ink)), Spacer(), Icon(Icons.keyboard_arrow_down, size: 17, color: muted)])),
    ])),
    const SizedBox(height: 10),
    _card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(children: [Icon(Icons.note_alt_outlined, size: 15, color: navy), SizedBox(width: 6), Text('Catatan / Keterangan Kehadiran (Opsional)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: ink))]),
      const SizedBox(height: 5),
      const Text('Wajib diisi jika sedang penugasan WFH, dinas luar, atau izin terlambat.', style: TextStyle(fontSize: 9, color: muted)),
      const SizedBox(height: 8),
      TextField(controller: note, maxLines: 2, decoration: _inputDecoration('Tambah catatan jika WFH/dinas luar kota atau kendala...', Icons.edit_note).copyWith(prefixIcon: null)),
    ])),
    const SizedBox(height: 10),
    Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFFEAF1FF), borderRadius: BorderRadius.circular(10)), child: const Row(children: [Icon(Icons.verified_user_outlined, color: navy, size: 18), SizedBox(width: 8), Expanded(child: Text('Lokasi Anda telah diverifikasi aman oleh server PresenTech tanpa deteksi Mock Location (GPS Palsu).', style: TextStyle(fontSize: 9, color: navy, height: 1.35)))])),
    const SizedBox(height: 12),
    SizedBox(height: 46, child: FilledButton.icon(onPressed: widget.checkedIn ? null : () => _confirm(context, 'Check-In Masuk', widget.onCheckIn), icon: const Icon(Icons.login, size: 17), label: const Text('Check-In Masuk'), style: FilledButton.styleFrom(backgroundColor: navy, disabledBackgroundColor: const Color(0xFFBFC9E2), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9))))),
    const SizedBox(height: 8),
    SizedBox(height: 44, child: OutlinedButton.icon(onPressed: (!widget.checkedIn || widget.checkedOut) ? null : () => _confirm(context, 'Check-Out Pulang', widget.onCheckOut), icon: const Icon(Icons.logout, size: 16), label: const Text('Check-Out Pulang (Aktif Pukul 17:00)'), style: OutlinedButton.styleFrom(foregroundColor: navy, side: const BorderSide(color: line), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9))))),
  ]);
}

void _confirm(BuildContext context, String title, VoidCallback action) => showDialog(context: context, builder: (ctx) => AlertDialog(
  title: Text(title), content: const Text('Lanjutkan proses presensi? Lokasi perangkat akan diperiksa oleh sistem.'),
  actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Batal')), FilledButton(onPressed: () { Navigator.pop(ctx); action(); }, child: const Text('Konfirmasi'))],
));

class _GeofenceMap extends StatelessWidget {
  const _GeofenceMap();
  @override Widget build(BuildContext context) => Container(height: 178, width: double.infinity, decoration: BoxDecoration(color: const Color(0xFFEAF0FB), borderRadius: BorderRadius.circular(9)), child: CustomPaint(painter: _MapPainter(), child: const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.location_on, size: 27, color: navy), Text('Kantor Pusat (50m)', style: TextStyle(fontSize: 9, color: navy, fontWeight: FontWeight.w700))]))));
}
class _MapPainter extends CustomPainter {
  @override void paint(Canvas canvas, Size s) {
    final road = Paint()..color = Colors.white..strokeWidth = 18..style = PaintingStyle.stroke;
    final thin = Paint()..color = const Color(0xFFD7E1F0)..strokeWidth = 1;
    for (int i=1;i<5;i++) { final x=s.width*i/5; canvas.drawLine(Offset(x,0),Offset(x,s.height),road); canvas.drawLine(Offset(0,s.height*i/5),Offset(s.width,s.height*i/5),road); }
    for (int i=1;i<5;i++) { final x=s.width*i/5; canvas.drawLine(Offset(x,0),Offset(x,s.height),thin); canvas.drawLine(Offset(0,s.height*i/5),Offset(s.width,s.height*i/5),thin); }
    final center=Offset(s.width*.51,s.height*.51);
    canvas.drawCircle(center, 45, Paint()..color=navy.withOpacity(.10));
    canvas.drawCircle(center, 45, Paint()..color=navy..style=PaintingStyle.stroke..strokeWidth=1.5);
    canvas.drawCircle(center, 4, Paint()..color=navy);
    final dot=Paint()..color=cyan; canvas.drawCircle(Offset(s.width*.18,s.height*.25),4,dot); canvas.drawCircle(Offset(s.width*.82,s.height*.72),4,dot);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(s.width-95,s.height-25,84,17),const Radius.circular(4)),Paint()..color=Colors.white);
    final tp=TextPainter(text:const TextSpan(text:'GPS Terkunci • ±4m',style:TextStyle(fontSize:7,color:muted)),textDirection:TextDirection.ltr); tp.layout(); tp.paint(canvas,Offset(s.width-90,s.height-22));
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;
}

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
      const _TopBar(),
      const SizedBox(height: 16),
      Row(children: [const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Riwayat Presensi', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: ink)), Text('Bab C.4 • Rekap Log Digital Karyawan', style: TextStyle(fontSize: 9, color: muted))])), OutlinedButton.icon(onPressed: () => _message(context, 'Riwayat siap diekspor setelah backend dihubungkan.'), icon: const Icon(Icons.download, size: 13), label: const Text('Export', style: TextStyle(fontSize: 10)), style: OutlinedButton.styleFrom(foregroundColor: navy, side: const BorderSide(color: line))) ]),
      const SizedBox(height: 12),
      _card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: const [Icon(Icons.calendar_month, size: 15, color: navy), SizedBox(width: 7), Text('Periode Presensi', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: ink)), Spacer(), Text('Maret 2025  ⌄', style: TextStyle(fontSize: 10, color: muted))]),
        const SizedBox(height: 12),
        Row(children: const [Expanded(child: _SummaryBox(title:'Total Hadir', value:'20', unit:'Hari', color:Color(0xFFEAF7FA))), SizedBox(width:7), Expanded(child: _SummaryBox(title:'Terlambat', value:'1', unit:'Hari', color:Color(0xFFFFF7E5))), SizedBox(width:7), Expanded(child: _SummaryBox(title:'Kehadiran', value:'98%', unit:'Rasio', color:Color(0xFFEEF2FF)))]),
      ])),
      const SizedBox(height: 13),
      Wrap(spacing: 7, children: ['Semua','Hadir','Terlambat','Izin/Cuti'].map((v) => ChoiceChip(label: Text(v, style: TextStyle(fontSize: 10, color: filter==v?Colors.white:ink)), selected: filter==v, onSelected: (_) => onFilter(v), selectedColor: navy, backgroundColor: Colors.white, side: const BorderSide(color: line), showCheckmark: false, padding: const EdgeInsets.symmetric(horizontal: 6))).toList()),
      const SizedBox(height: 14),
      Row(children: [const Text('Catatan Riwayat Presensi', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: ink)), const Spacer(), Text('${shown.length} data terbaru', style: const TextStyle(fontSize: 9, color: muted))]),
      const SizedBox(height: 9),
      ...shown.map((r) => Padding(padding: const EdgeInsets.only(bottom: 9), child: _HistoryCard(day:r.$1, number:r.$2, date:r.$3, checkIn:r.$4, checkOut:r.$5, status:r.$6, color:r.$7))),
      const SizedBox(height: 8),
      const Center(child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.verified_user, color: navy, size: 12), SizedBox(width: 5), Text('Terverifikasi Kriptografi GPS PresenTech v2.4', style: TextStyle(fontSize: 8, color: muted))])),
    ]);
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(18, 14, 18, 24), children: [
    const _TopBar(), const SizedBox(height: 22),
    _card(child: Column(children: [
      const CircleAvatar(radius: 39, backgroundColor: Color(0xFFE6EEFF), child: Icon(Icons.person, color: navy, size: 42)),
      const SizedBox(height: 10), const Text('Timothy Christopher Suryadi', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: ink)),
      const SizedBox(height: 4), const Text('Karyawan • Teknik Informatika', style: TextStyle(fontSize: 11, color: muted)),
      const SizedBox(height: 12), const _Pill('Akun Aktif', green),
    ])),
    const SizedBox(height: 17),
    const Text('Informasi Pengguna', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: ink)),
    const SizedBox(height: 9),
    _card(child: const Column(children: [
      _ProfileRow(icon: Icons.badge_outlined, label: 'Nomor Induk Karyawan', value: '20240801256'),
      Divider(color: line, height: 20), _ProfileRow(icon: Icons.email_outlined, label: 'Email', value: 'timothy.suryadi@esaunggul.ac.id'),
      Divider(color: line, height: 20), _ProfileRow(icon: Icons.apartment, label: 'Departemen', value: 'Teknik Informatika'),
      Divider(color: line, height: 20), _ProfileRow(icon: Icons.work_outline, label: 'Jabatan', value: 'Staff / Mahasiswa'),
    ])),
    const SizedBox(height: 18),
    OutlinedButton.icon(onPressed: () => showDialog(context: context, builder: (ctx) => AlertDialog(title: const Text('Keluar dari akun?'), content: const Text('Anda akan kembali ke halaman login PresenTech.'), actions: [TextButton(onPressed:()=>Navigator.pop(ctx),child:const Text('Batal')), FilledButton(onPressed:(){Navigator.pop(ctx);Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:(_)=>const LoginPage()),(r)=>false);},child:const Text('Logout'))])), icon: const Icon(Icons.logout, size: 17), label: const Text('Logout'), style: OutlinedButton.styleFrom(foregroundColor: red, side: const BorderSide(color: Color(0xFFF0C8CC)), minimumSize: const Size.fromHeight(46))),
  ]);
}

class _TopBar extends StatelessWidget {
  const _TopBar();
  @override Widget build(BuildContext context) => Row(children: [
    const CircleAvatar(radius: 16, backgroundColor: Color(0xFFE7EFFC), child: Icon(Icons.apartment, size: 17, color: navy)),
    const SizedBox(width: 8), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('PresenTech', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: navy)), Text('Karyawan Portal', style: TextStyle(fontSize: 9, color: muted))])),
    IconButton(onPressed: () => _message(context, 'Tidak ada notifikasi baru.'), icon: const Icon(Icons.notifications_none, size: 21, color: ink)),
  ]);
}

Widget _card({required Widget child}) => Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFEAF0F3)), boxShadow: const [BoxShadow(color: Color(0x080E3155), blurRadius: 8, offset: Offset(0,2))]), child: child);

class _StatCard extends StatelessWidget {
  final String title,value,unit,foot; final Color color; final IconData icon;
  const _StatCard({required this.title,required this.value,required this.unit,required this.foot,required this.color,required this.icon});
  @override Widget build(BuildContext context)=>Container(padding:const EdgeInsets.all(9),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(10),border:Border(left:BorderSide(color:color,width:3),top:const BorderSide(color:line),right:const BorderSide(color:line),bottom:const BorderSide(color:line))),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Row(children:[Expanded(child:Text(title,style:const TextStyle(fontSize:9,color:muted))),Icon(icon,color:color,size:12)]),const SizedBox(height:5),Text(value,style:const TextStyle(fontSize:19,fontWeight:FontWeight.w800,color:ink)),Text(unit,style:const TextStyle(fontSize:8,color:muted)),const SizedBox(height:5),Text(foot,style:TextStyle(fontSize:8,color:color,fontWeight:FontWeight.w700))]));
}
class _Pill extends StatelessWidget {
  final String text; final Color color; const _Pill(this.text,this.color);
  @override Widget build(BuildContext context)=>Container(padding:const EdgeInsets.symmetric(horizontal:7,vertical:4),decoration:BoxDecoration(color:color.withOpacity(.10),borderRadius:BorderRadius.circular(20)),child:Text('• $text',style:TextStyle(fontSize:8,color:color,fontWeight:FontWeight.w700)));
}
class _MiniHistory extends StatelessWidget {
  final String date,time,status,out;final Color color;
  const _MiniHistory({required this.date,required this.time,required this.status,required this.color,required this.out});
  @override Widget build(BuildContext context)=>_card(child:Row(children:[Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(date,style:const TextStyle(fontSize:10,fontWeight:FontWeight.w800,color:ink)),const SizedBox(height:5),Text('Masuk: $time   Pulang: $out',style:const TextStyle(fontSize:9,color:muted))])),_Pill(status,color)]));
}
class _DataChip extends StatelessWidget {
  final String label,value; final bool greenText; const _DataChip({required this.label,required this.value,this.greenText=false});
  @override Widget build(BuildContext context)=>Container(padding:const EdgeInsets.all(8),decoration:BoxDecoration(color:bg,borderRadius:BorderRadius.circular(7)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(label,style:const TextStyle(fontSize:7,color:muted)),const SizedBox(height:4),Text(value,style:TextStyle(fontSize:9,fontWeight:FontWeight.w700,color:greenText?green:ink))]));
}
class _SummaryBox extends StatelessWidget {
  final String title,value,unit; final Color color; const _SummaryBox({required this.title,required this.value,required this.unit,required this.color});
  @override Widget build(BuildContext context)=>Container(padding:const EdgeInsets.all(9),decoration:BoxDecoration(color:color,borderRadius:BorderRadius.circular(8)),child:Column(children:[Text(title,style:const TextStyle(fontSize:8,color:muted)),const SizedBox(height:4),Text(value,style:const TextStyle(fontSize:17,fontWeight:FontWeight.w800,color:ink)),Text(unit,style:const TextStyle(fontSize:8,color:muted))]));
}
class _HistoryCard extends StatelessWidget {
  final String day,number,date,checkIn,checkOut,status;final Color color;
  const _HistoryCard({required this.day,required this.number,required this.date,required this.checkIn,required this.checkOut,required this.status,required this.color});
  @override Widget build(BuildContext context)=>_card(child:Column(children:[
    Row(children:[Container(width:34,padding:const EdgeInsets.symmetric(vertical:6),decoration:BoxDecoration(color:const Color(0xFFEEF2FF),borderRadius:BorderRadius.circular(7)),child:Column(children:[Text(day,style:const TextStyle(fontSize:7,color:navy,fontWeight:FontWeight.w700)),Text(number,style:const TextStyle(fontSize:14,color:navy,fontWeight:FontWeight.w800))])),const SizedBox(width:9),Expanded(child:Text(date,style:const TextStyle(fontSize:11,fontWeight:FontWeight.w800,color:ink))),_Pill(status,color)]),
    const Divider(color:line,height:18),
    Row(children:[Expanded(child:_historyTime('Check-in',checkIn,green)),Expanded(child:_historyTime('Check-out',checkOut,navy)),Expanded(child:_historyTime('Total Durasi','9j 11m',muted))]),
    const SizedBox(height:9),const Row(children:[Icon(Icons.apartment,size:11,color:muted),SizedBox(width:5),Text('Kantor Utama',style:TextStyle(fontSize:8,color:muted)),Spacer(),Icon(Icons.verified_user_outlined,size:10,color:cyan),SizedBox(width:4),Text('Geofence OK',style:TextStyle(fontSize:8,color:cyan,fontWeight:FontWeight.w700))]),
  ]));
}
Widget _historyTime(String label,String value,Color color)=>Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(label,style:const TextStyle(fontSize:8,color:muted)),const SizedBox(height:4),Row(children:[Icon(Icons.access_time,size:11,color:color),const SizedBox(width:3),Text(value,style:const TextStyle(fontSize:9,fontWeight:FontWeight.w700,color:ink))])]);
class _ProfileRow extends StatelessWidget {
  final IconData icon;final String label,value;const _ProfileRow({required this.icon,required this.label,required this.value});
  @override Widget build(BuildContext context)=>Row(children:[Icon(icon,size:17,color:navy),const SizedBox(width:10),Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(label,style:const TextStyle(fontSize:9,color:muted)),const SizedBox(height:3),Text(value,style:const TextStyle(fontSize:11,fontWeight:FontWeight.w700,color:ink))]))]);
}
void _message(BuildContext context,String message)=>ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message),behavior:SnackBarBehavior.floating,backgroundColor:navy));
