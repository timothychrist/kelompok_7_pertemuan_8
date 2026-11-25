import 'package:flutter/material.dart';

void showConfirmDialog(BuildContext context, String title, VoidCallback action) => showDialog(context: context, builder: (ctx) => AlertDialog(
  title: Text(title), content: const Text('Lanjutkan proses presensi? Lokasi perangkat akan diperiksa oleh sistem.'),
  actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Batal')), FilledButton(onPressed: () { Navigator.pop(ctx); action(); }, child: const Text('Konfirmasi'))],
));
