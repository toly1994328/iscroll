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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> data = List.generate(60, (index) => '第$index个');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dismissible 测试'),),
      body: ListView.builder(
        itemCount: data.length,
        // separatorBuilder: (_,__)=>Divider(height: 1/window.devicePixelRatio,),
        itemBuilder: _buildItems,
      ),
    );
  }

  Widget _buildItems(BuildContext context, int index) {
    return Dismissible(
      key: ValueKey(data[index]),
      child: ItemBox(
        info: data[index],
      ),
      onDismissed: (direction) =>_onDismissed(direction,index),
    );
  }

  void _onDismissed(DismissDirection direction,int index) {
    setState(() {
      data.removeAt(index);
      print('index:$index=====length:${data.length}');
    });
  }
}

class ItemBox extends StatelessWidget {
  final String info;

  const ItemBox({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 56,
      child: Text(
        info,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class CustomDismissible extends StatefulWidget {
  @override
  _CustomDismissibleState createState() => _CustomDismissibleState();
}

class _CustomDismissibleState extends State<CustomDismissible> {
  List<Color> data = <Color>[
    Colors.purple[50]!,
    Colors.purple[100]!,
    Colors.purple[200]!,
    Colors.purple[300]!,
    Colors.purple[400]!,
    Colors.purple[500]!,
    Colors.purple[600]!,
    Colors.purple[700]!,
    Colors.purple[800]!,
    Colors.purple[900]!,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5),
        children: data.map((color) => _buildItem(color)).toList(),
      ),
    );
  }

  Widget _buildItem(Color color) {
    return Dismissible(
      background: Container(
        color: Colors.green,
        alignment: Alignment(-0.9, 0),
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        alignment: Alignment(0.9, 0),
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
        color: Colors.red,
      ),
      key: ValueKey(color),
      onDismissed: (d) {
        data.remove(color);
      },
      confirmDismiss: (e) async {
        if (e == DismissDirection.endToStart) {
          return true;
        } else {
          return false;
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        color: color,
        child: Text(
          colorString(color),
          style: TextStyle(color: Colors.white, shadows: [
            Shadow(color: Colors.black, offset: Offset(.5, .5), blurRadius: 2)
          ]),
        ),
      ),
    );
  }

  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
}
