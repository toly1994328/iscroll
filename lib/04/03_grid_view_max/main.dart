
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

  final List<int> data = List.generate(60, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = data
        .map((index) => ItemBox(
              index: index,
            ))
        .toList();

    print(MediaQuery.of(context).size);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView 测试'),
      ),
      body:
      GridView(
        children: children,// 360-16
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 121,
            // crossAxisSpacing: 8,
            childAspectRatio: 2,
            // mainAxisSpacing: 8,
        ),
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

  Color get color => Colors.blue.withOpacity((index % 10) * 0.1);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: color,
      height: 56,
      child: Text(
        '第 $index 个',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
