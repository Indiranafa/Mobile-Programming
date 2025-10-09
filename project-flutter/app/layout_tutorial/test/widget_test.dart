// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:layout_tutorial/main.dart';

void main() {
  testWidgets('Layout app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our layout app shows the correct title.
    expect(find.text('Flutter Layout Demo'), findsOneWidget);
    expect(find.text('Oeschinen Lake Campground'), findsOneWidget);
    expect(find.text('Kandersteg, Switzerland'), findsOneWidget);

    // Verify that buttons are present.
    expect(find.text('CALL'), findsOneWidget);
    expect(find.text('ROUTE'), findsOneWidget);
    expect(find.text('SHARE'), findsOneWidget);

    // Verify that star rating is present.
    expect(find.text('41'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
  });
}