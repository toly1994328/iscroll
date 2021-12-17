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
        child: DeleteDraggable(),
      ),
    );
  }
}

class DeleteDraggable extends StatefulWidget {
  @override
  _DeleteDraggableState createState() => _DeleteDraggableState();
}

class _DeleteDraggableState extends State<DeleteDraggable> {
  List<Color> colors = [
    Colors.red, Colors.yellow, Colors.blue, Colors.green,
    Colors.orange, Colors.purple, Colors.cyanAccent];

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            children: _buildDraggable(),
            spacing: 10,
          ),
          SizedBox(
            height: 20,
          ),
          DragTarget<int>(
              onAccept: _onAccept,
              onWillAccept: (data) => data != null,
              builder: buildTarget)
        ],
    );
  }

  Widget buildTarget(context, candidateData, rejectedData) => Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      child: Center(
        child: Icon(Icons.delete_sweep, color: Colors.white),
      ));

  List<Widget> _buildDraggable() => colors
      .map((Color color) => Draggable<int>(
            child: buildContent(color),
            data: colors.indexOf(color),
            childWhenDragging: buildWhenDragging(),
            feedback: buildFeedback(color)),
      ).toList();

  Widget buildContent(Color color) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      child: Text(
        colors.indexOf(color).toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget buildFeedback(Color color) {
    return Container(
      width: 25,
      height: 25,
      decoration:
          BoxDecoration(color: color.withAlpha(100), shape: BoxShape.circle),
    );
  }

  Widget buildWhenDragging() {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      child: Icon(Icons.delete_outline, size: 20, color: Colors.white,
      ),
    );
  }

  void _onAccept(int data) {
    setState(() {
      colors.removeAt(data);
    });
  }
}
