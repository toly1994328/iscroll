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
      body:
      PageView(
        children: children,
        allowImplicitScrolling: true,
        // allowImplicitScrolling: false,
      ),
    );
  }
}

class ItemBox extends StatefulWidget {
  final int index;

  ItemBox({
    Key? key,
    required this.index,
  });

  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {
  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
  ];

  Color get color => colors[widget.index % colors.length];

  @override
  void initState() {
    super.initState();
    print('初始化状态:第 ${widget.index} 个');
  }

  @override
  void dispose() {
    print('销毁状态:第 ${widget.index} 个');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('=========构建 ItemBox :${widget.index}=========');
    return Container(
      alignment: Alignment.center,
      color: color,
      height: 56,
      child: Text(
        '第 ${widget.index} 个',
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
