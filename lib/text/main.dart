import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintStyle:
                    TextStyle(fontSize: 14, color: Color(0xff808080)),
                    hintText: '请输入用户名',
                   )
            ),
            TextField(
              obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintStyle:
                  TextStyle(fontSize: 14, color: Color(0xff808080)),
                  hintText: '请输入密码',
                )
            ),
          ],
        ),
      ),
    );
  }
}