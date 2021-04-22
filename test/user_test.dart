import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testFlutter/main.dart';
import 'package:testFlutter/user.dart';

void main() {
  test('User', () {
    final user = User();

    user.name = "is";
    // expect คือ เราต้องให้ผลลัพธ์ออกมาเป็นอะไร
    expect(user.name, "is");
  });
  // เอา 3 เคส ไว้ในกลุ่มเดียวกัน
  group('User', () {
    test('Test User Name', () {
      final user = User();

      user.name = "issaraphap";
      expect(user.name, "issaraphap");
    });

    test('Age', () {
      final user = User();

      user.age = 23;
      expect(user.age, 23);
    });

    test('Test User Status', () {
      final user = User();

      user.name = "สบายดี";
      expect(user.name, "สบายดี");
    });
  });

  group('User', () {
    testWidgets('finds a Text Widget', (WidgetTester tester) async {
      //pumpWidget คือ การใส่ Widget เข้าไปใน tester
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
              body: Container(child: Center(child: Text('Issaraphap')))),
        ),
      );

      expect(find.text('Issaraphap'), findsOneWidget);
    });
  });

  group('User', () {
    testWidgets('finds a Text Widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Text('H'),
        ),
      );
      //findsNothing คือ ไม่เจออะไรเลยก็ได้
      expect(find.text('X'), findsNothing);
    });
  });

//ค้นหา widget ด้วย widget ต้องเป็น widget เดียวกันเท่านั้น
  testWidgets('finds a Text Widget by Widget', (WidgetTester tester) async {
    final Widget widget = Text("");

    await tester.pumpWidget(
      MaterialApp(
        home: Container(child: Center(child: widget)),
      ),
    );

    //findsOneWidget คือ หา 1 widget
    //คำสั่งค้นหา widget find.byWidget(widget)
    expect(find.byWidget(widget), findsOneWidget);
  });
}
