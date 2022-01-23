import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/viewport_offset.dart';

void main() {
  runApp(MyApp());
}

class MyScrollBehavior extends ScrollBehavior{

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child,
      ScrollableDetails details) {
    return child;
  }
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

  final List<int> data = List.generate(48, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrollable#physics'),
      ),
      body: Scrollable(
        scrollBehavior: MyScrollBehavior(),

        // physics: const BouncingScrollPhysics(parent: ClampingScrollPhysics()),
        physics: const ClampingScrollPhysics(parent: BouncingScrollPhysics()),
        // physics: const PageScrollPhysics(
        //   parent: BouncingScrollPhysics(),
        // ),
        // physics: const BouncingScrollPhysics(
        //   parent: const AlwaysScrollableScrollPhysics()
        // ),
        viewportBuilder: _buildViewPort,
      ),
    );
  }

  Widget _buildViewPort(BuildContext context, ViewportOffset position) {
    return Viewport(
      offset: position,
      slivers: [_buildSliverList()],
    );
  }

  Widget _buildSliverList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      _buildItemByIndex,
      childCount: data.length,
    ));
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
  }) : super(key: key) {
    // print('----构建ItemBox-----$index--------');
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
