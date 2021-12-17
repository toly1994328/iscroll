import 'dart:ui';

import 'package:flutter/material.dart';

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
      // appBar: AppBar(title: Text('ListView 基础测试'),),
      body: Center(child: ImageFilteredDemo()),
    );
  }
}

class ImageFilteredDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children:[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/sabar.webp',
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
            Text('原图')
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.srgbToLinearGamma(),
              child:  Image.asset(
                'assets/images/sabar.webp',
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
            ),
            Text('srgbToLinearGamma')
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.linearToSrgbGamma(),
              child:  Image.asset(
                'assets/images/sabar.webp',
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
            ),
            Text('linearToSrgbGamma')
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.matrix(<double>[
                1,0,0,0,110,
                0,1,0,0,110,
                0,0,1,0,110,
                0,0,0,1,0
              ]),
              child:  Image.asset(
                'assets/images/sabar.webp',
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
            ),
            Text('matrix')
          ],
        ),
      ] ,
    );
  }
}
