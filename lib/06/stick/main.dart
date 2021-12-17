import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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
        title: const Text('CustomScrollView 测试'),
      ),
      body:
      CustomScrollView(
        slivers: [
          _buildBox(),
          _buildPersistentHeader('A-Group',SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: _buildSliverGrid(),
          )),
          _buildPersistentHeader('B-Group',_buildSliverList(4)),
          _buildPersistentHeader('C-Group',_buildSliverList(1)),
          _buildPersistentHeader('D-Group',_buildSliverList(5)),
          _buildPersistentHeader('E-Group',_buildSliverList(5)),
          _buildPersistentHeader('F-Group',_buildSliverList(50)),
        ],
      ),
    );
  }

  Widget _buildPersistentHeader(String tag,Widget sliver) =>
      SliverStickyHeader(
        sticky: true,
        overlapsContent: false ,
        sliver: sliver,
        header: Container(
          height: 54,
            alignment: Alignment.center,
            color: Colors.orangeAccent,
            child: Text(
              tag,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
      ));

  Widget _buildBox() {
    return SliverToBoxAdapter(
      child: Container(
        height: 80,
        color: Colors.amber,
      ),
    );
  }

  Widget _buildSliverList(int length) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
          _buildItemByIndex,
          childCount: length,
        ));
  }

  Widget _buildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        _buildItemByIndex,
        childCount: 8,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        childAspectRatio: 1,
        mainAxisSpacing: 8,
      ),
    );
  }

  Widget _buildItemByIndex(BuildContext context, int index) {
    return ItemBox(
      index: data[index],
    );
  }
}

class ItemBox extends StatelessWidget {
  final int index;

  ItemBox({
    Key? key,
    required this.index,
  }) ;

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

