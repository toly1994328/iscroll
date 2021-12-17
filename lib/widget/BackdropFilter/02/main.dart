import 'dart:math';
import 'dart:ui' as ui;

import 'package:dash_painter/dash_decoration.dart';
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
      body: Center(
        child: CustomBackdropFilter(),
      ),
    );
  }
}

class CustomBackdropFilter extends StatelessWidget {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    String data = '';
    for (int i = 0; i < 10000; i++) {
      data += random.nextBool() ? " 0 " : " 1 ";
    }

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Text(
          data,
          textAlign: TextAlign.left,
        ),
        Center(
          child:
              // ClipRRect( // <-- clips to the 200x200 [Container] below
              //   borderRadius: BorderRadius.circular(20),
              //   child:

              buildFilterZone(),
        ),
        // ),
      ],
    );

    //   Column(
    //   children: <Widget>[
    //     Stack(
    //       children: <Widget>[
    //         _buildImage(),
    //         Positioned.fill(
    //           child: ClipRect(
    //             child: BackdropFilter(
    //               filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
    //               child: Container(
    //                 color: Colors.black.withAlpha(0),
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //     _buildSliders()
    //   ],
    // );
  }

  Widget buildFilterZone() {
    return BackdropFilter(
      filter: ui.ImageFilter.blur(
        sigmaX: 2.0,
        sigmaY: 2.0,
      ),
      child: Container(
        alignment: Alignment.center,
        width: 200.0,
        height: 120.0,
        color: Colors.purple.withOpacity(0.1),
        child: const Text(
          'Hello World',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  // Widget _buildImage() {
  //   return Wrap(
  //     spacing: 20,
  //     children: <Widget>[
  //       Container(
  //         height: 150,
  //         width: 150,
  //         child: Image.asset(
  //           'assets/images/sabar.webp',
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       Container(
  //         height: 150,
  //         width: 150,
  //         child: Image.asset(
  //           'assets/images/wy_200x300.webp',
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildSliders() => Column(
  //       children: <Widget>[
  //         Slider(
  //             min: 0,
  //             max: 4,
  //             value: _sigmaX,
  //             divisions: 360,
  //             label: 'x:' + _sigmaX.toStringAsFixed(1),
  //             onChanged: (v) {
  //               setState(() {
  //                 _sigmaX = v;
  //               });
  //             }),
  //         Slider(
  //             min: 0,
  //             max: 4,
  //             value: _sigmaY,
  //             divisions: 360,
  //             label: 'beta:' + _sigmaY.toStringAsFixed(1),
  //             onChanged: (v) {
  //               setState(() {
  //                 _sigmaY = v;
  //               });
  //             })
  //       ],
  //     );
}
