import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testFlutter/main.dart';

void main() {
  testWidgets('Reverse', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    //หาว่าเป็นTextField
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    //รอให้พิมinput enterText
    await tester.enterText(textField, 'Issaraphap');

    //หาText
    expect(find.text('Issaraphap'), findsOneWidget);
    //หาปุ่ม
    var button = find.byIcon(Icons.arrow_back_rounded);
    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pump();

    //กดปุ่ม

    //หา text ที่ชื่อ issaraphap
    expect(find.text("Issaraphap"), findsOneWidget);
  });
}
