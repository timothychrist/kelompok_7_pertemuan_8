import 'package:flutter_test/flutter_test.dart';

import 'package:kelompok_7_pertemuan_8/app.dart';

void main() {
  testWidgets('App menampilkan halaman login', (WidgetTester tester) async {
    await tester.pumpWidget(const PresenTechApp());

    expect(find.text('PresenTech'), findsOneWidget);
    expect(find.text('Masuk ke PresenTech'), findsOneWidget);
  });
}
