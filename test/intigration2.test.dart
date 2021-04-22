import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testFlutter/main.dart';

void main() {
  testWidgets('กด 1000 ครั้ง', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    //กดปุ่ม 1000 ครั้ง
    for (int i = 0; i > -1000; i--) {
      //หาText
      expect(find.text('$i'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.exposure_minus_1));
      await tester.pump();

      expect(find.text((i - 1).toString()), findsOneWidget);
    }
  });
}
