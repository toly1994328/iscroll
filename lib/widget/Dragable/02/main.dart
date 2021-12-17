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
        child: DraggablePage(),
      ),
    );
  }
}

class DraggablePage extends StatefulWidget {
  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  Color _color = Colors.grey;
  String _info = 'DragTarget';

  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.cyanAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            children: _buildDraggable(),
            spacing: 10,
          ),
          SizedBox(
            height: 20,
          ),
          DragTarget<Color>(
            onLeave: _onLeave,
            onAccept: _onAccept,
            onWillAccept: _onWillAccept,
            builder: _buildTarget,
          )
        ],
      ),
    );
  }

  List<Widget> _buildDraggable() {
    return colors
        .map(
          (Color color) => Draggable<Color>(
          onDragStarted: _onDragStarted,
          onDragEnd: _onDragEnd,
          onDragCompleted: _onDragCompleted,
          onDragUpdate: _onDragUpdate,
          onDraggableCanceled: _onDraggableCanceled,
          childWhenDragging:
          childWhenDragging(colors.indexOf(color).toString()),
          child: buildContent(color),
          data: color,
          feedback: buildFeedback(color)),
    )
        .toList();
  }

  Widget buildFeedback(Color color) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

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

  Widget childWhenDragging(String text) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }

  void _onDragUpdate(DragUpdateDetails details) {
    print('坐标:'
        '（${details.localPosition.dx.toStringAsFixed(1)},'
        '${details.localPosition.dy.toStringAsFixed(1)})');
  }

  void _onDraggableCanceled(Velocity velocity, Offset offset) {
    print("_onDraggableCanceled");
    _info = '拖拽取消';
  }

  void _onDragCompleted() {
    _info = '拖拽完成';
  }

  void _onDragEnd(DraggableDetails details) {
    setState(() => _info = '结束拖拽');
  }

  void _onDragStarted() {
    setState(() => _info = '开始拖拽');
  }

  Widget _buildTarget(BuildContext context, List<Color?> candidateData, List rejectedData) {
    return Container(
        width: 150.0,
        height: 50.0,
        color: _color,
        child: Center(
          child: Text(
            _info,
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  void _onLeave(Color? data) {
    print("onLeave: data = $data ");
    setState(() => _info = 'onLeave');
  }

  void _onAccept(Color data) {
    print("onAccept: data = $data ");
    setState(() => _color = data);
  }

  bool _onWillAccept(Color? data) {
    print("onWillAccept: data = $data ");
    setState(() => _info = 'onWillAccept');
    return data != null;
  }
}
