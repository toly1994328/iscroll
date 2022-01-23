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
  HomePage({Key? key}) : super(key: key);

  final List<int> data = List.generate(4, (index) => index);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = data
        .map((index) => ItemBox(
              index: index,
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView 测试'),
      ),
      body: PageView(
        pageSnapping: true,
        // pageSnapping: false,
        children: children,
      ),
    );
  }
}

class ItemBox extends StatelessWidget {
  final int index;

  ItemBox({
    Key? key,
    required this.index,
  }) : super(key: key) {
    print('----构建ItemBox-----$index--------');
  }

  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
  ];

  Color get color => colors[index % colors.length];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: color,
      height: 56,
      child: Text(
        '第 $index 个',
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
