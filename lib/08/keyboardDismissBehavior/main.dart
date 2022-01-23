import 'package:flutter/material.dart';

import 'list_view_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // debugShowMaterialGrid: true,
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
      appBar: AppBar(title: Container(
        alignment: Alignment.center,
        height: 36,
        margin: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 0,left: 10,right: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),

            ),
            filled: true,
            fillColor: Colors.white
          ),
        ),
      ),),
      body: ListViewDemo(),
    );
  }
}
