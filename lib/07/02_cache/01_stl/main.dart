import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/viewport_offset.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viewport#cache 测试'),
      ),
      body: Scrollable(
        viewportBuilder: _buildViewPort,
      ),
    );
  }

  Widget _buildViewPort(BuildContext context, ViewportOffset position) {
    return Viewport(
      // cacheExtent: 0,
      offset: position,
      slivers: [
        _buildSliverList()
      ],
    );
  }

  Widget _buildSliverList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (_,index)=>ItemBox(
        index: data[index],
      ),
      childCount: data.length,
    ));
  }
}

class ItemBox extends StatelessWidget {
  final int index;

  ItemBox({
    Key? key,
    required this.index,
  });


  Color get color => Colors.blue.withOpacity((index % 10) * 0.1);

  @override
  Widget build(BuildContext context) {
    print('----构建ItemBox-----${index}--------');
    return Container(
      alignment: Alignment.center,
      color: color,
      height: 56,
      child: Text(
        '第 ${index} 个',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
