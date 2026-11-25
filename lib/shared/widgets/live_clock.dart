import 'dart:async';
import 'package:flutter/material.dart';

const _hari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
const _bulan = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];

String _two(int n) => n.toString().padLeft(2, '0');

/// Format "HH:mm:ss" dari waktu WIB.
String formatJam(DateTime t) => '${_two(t.hour)}:${_two(t.minute)}:${_two(t.second)}';

/// Format "Senin, 24 Maret 2025" dari waktu WIB.
String formatTanggal(DateTime t) => '${_hari[t.weekday - 1]}, ${t.day} ${_bulan[t.month - 1]} ${t.year}';

/// Widget yang rebuild tiap detik dengan waktu WIB (UTC+7) saat ini,
/// apa pun zona waktu perangkat.
class LiveClock extends StatefulWidget {
  final Widget Function(BuildContext context, DateTime wib) builder;
  const LiveClock({super.key, required this.builder});
  @override State<LiveClock> createState() => _LiveClockState();
}

class _LiveClockState extends State<LiveClock> {
  late DateTime _now = _wibNow();
  Timer? _timer;

  static DateTime _wibNow() => DateTime.now().toUtc().add(const Duration(hours: 7));

  @override void initState() {
    super.initState();
    _scheduleNextTick();
  }

  // Tick tepat di pergantian detik supaya tidak melompat/terlambat.
  void _scheduleNextTick() {
    final ms = 1000 - DateTime.now().millisecond;
    _timer = Timer(Duration(milliseconds: ms), () {
      if (!mounted) return;
      setState(() => _now = _wibNow());
      _scheduleNextTick();
    });
  }

  @override void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override Widget build(BuildContext context) => widget.builder(context, _now);
}
