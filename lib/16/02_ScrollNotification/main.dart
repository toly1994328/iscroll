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
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> data = List.generate(63, (index) => index + 1);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body:
      NotificationListener<ScrollNotification>(
        onNotification: _listenScrollNotification,
        child: ListView.builder(
          itemBuilder: _buildItemByIndex,
          itemCount: data.length,
        ),
      ),
    );
  }

  Widget _buildItemByIndex(BuildContext context, int index) {
    return ItemBox(
      index: data[index],
    );
  }

  bool _listenScrollNotification(ScrollNotification notification) {
    // print('${notification.runtimeType}:'
    //     'minScrollExtent:${notification.metrics.minScrollExtent.toStringAsFixed(2)}  '
    //     'maxScrollExtent:${notification.metrics.maxScrollExtent.toStringAsFixed(2)}  '
    //     'pixels:${notification.metrics.pixels.toStringAsFixed(2)}  '
    //     'axis:${notification.metrics.axis}  '
    //     '');


    // if(notification is UserScrollNotification){
    //   print('${notification.runtimeType}:${notification.direction}  '
    //       'pixels:${notification.metrics.pixels.toStringAsFixed(2)}  '
    //       'axisDirection:${notification.metrics.axisDirection}  '
    //       '');
    // }

    // if(notification is ScrollUpdateNotification){
    //   print('${notification.runtimeType}:${notification.dragDetails}  '
    //       'scrollDelta:${notification.scrollDelta}  '
    //       'pixels:${notification.metrics.pixels.toStringAsFixed(2)}  '
    //       '');
    // }

    if(notification is OverscrollNotification){
      print('${notification.runtimeType}:${notification.dragDetails}  '
          'overscroll:${notification.overscroll.toStringAsFixed(2)}  '
          'velocity:${notification.velocity}  '
          'pixels:${notification.metrics.pixels.toStringAsFixed(2)}  '
          '');
    }
    return true;
  }
}

class ItemBox extends StatelessWidget {
  final int index;

  ItemBox({
    Key? key,
    required this.index,
  }) : super(key: key);

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
