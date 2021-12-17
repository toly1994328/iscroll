import 'package:flutter/material.dart';

import 'code_input_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      backgroundColor: Colors.white,
    resizeToAvoidBottomInset: false,
    body:Center(child: CodeInputForm())),
    );
  }
}
