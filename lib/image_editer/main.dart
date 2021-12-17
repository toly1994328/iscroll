import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        child: ImageEditor(),
      ),
    );
  }
}

class ImageEditor extends StatefulWidget {
  @override
  _ImageEditorState createState() => _ImageEditorState();
}

class _ImageEditorState extends State<ImageEditor> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40,
      children: [
        Column(
          children: [
            Image.asset(
              'assets/images/icon_head.jpg',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10,),
            Text("原图")
          ],
        ),
        Column(
          children: [
            ClipPath(
              clipper: ShapeBorderClipper(
                shape: CircleBorder(),
              ),
              child: Image.asset(
                'assets/images/icon_head.jpg',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 10,),
            Text("CircleBorder")
          ],
        ),
        Column(
          children: [
            ClipPath(
              clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              child: Image.asset(
                'assets/images/icon_head.jpg',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 10,),
            Text("RoundedRectangleBorder")
          ],
        ),
      ],
    );
  }
}
