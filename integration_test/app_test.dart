import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testFlutter/main.dart';
import 'package:testFlutter/testHard.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "ไม่ได้ป้อนข้อความ และไปที่หน้าแสดงผล จะแสดงข้อความว่าผิดพลาด",
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(Hard), findsOneWidget);
      expect(find.byType(DisplayPage), findsNothing);
      expect(find.text('Input at least one character'), findsOneWidget);
    },
  );

  testWidgets(
    'หลังจากป้อนข้อความแล้วไปที่หน้าแสดงผลที่มีข้อความเดียวกัน ',
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      //เข้ามาที่TextField แล้วใส่ข้อความ
      final inputText = 'Hello';
      await tester.enterText(find.byKey(Key('your-text-field')), inputText);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      //ที่หน้า hard จะไม่แสดงผลอะไร ถ้ามีข้อความ
      //จะมาที่หน้า DisplayPage จะเจอข้อความที่ input
      expect(find.byType(Hard), findsNothing);
      expect(find.byType(DisplayPage), findsOneWidget);
      expect(find.text(inputText), findsOneWidget);

      //กดปุ่ม back จะกลับมาหน้า hard
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      //กลับมาหน้า hard แล้วจะเจอ textfield ว่าง
      expect(find.byType(Hard), findsOneWidget);
      expect(find.byType(DisplayPage), findsNothing);
      expect(find.text(inputText), findsNothing);
    },
  );
}
