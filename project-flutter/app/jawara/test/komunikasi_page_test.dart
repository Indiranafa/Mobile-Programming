import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jawara/main.dart' as app;

void main() {
  testWidgets('Buka halaman komunikasi dari home', (WidgetTester tester) async {
    await tester.pumpWidget(const app.MyApp());

    // Pastikan tombol Navigasi ada
    expect(find.text('Buka Komunikasi'), findsOneWidget);

    // Tap dan navigasi
    await tester.tap(find.text('Buka Komunikasi'));
    await tester.pumpAndSettle();

    // Harusnya membuka halaman Komunikasi
    expect(find.text('Komunikasi'), findsOneWidget);
  });
}
