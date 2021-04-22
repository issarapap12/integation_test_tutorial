import 'package:flutter/material.dart';

class TextFieldTest extends StatefulWidget {
  @override
  _TextFieldTestState createState() => _TextFieldTestState();
}

class _TextFieldTestState extends State<TextFieldTest> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  TextEditingController controller;
  String reversed;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  Widget textS() {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buttonTF() {
    return FlatButton(
      child: Icon(Icons.arrow_back_rounded),
      onPressed: () {
        if (controller.text.isEmpty) return;

        setState(
          () {
            reversed = reverseString(controller.text);
            _incrementCounter();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Test'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            textS(),
            SizedBox(height: 10.0),
            if (reversed != null) ...{
              Text(
                reversed,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
            },
            buttonTF(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

String reverseString(String initial) {
  return initial.split('').reversed.join();
}
