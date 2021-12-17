import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
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
      // appBar: SliverAppBar()


      // AppBar(
      //   title: const Text('CustomScrollView 测试'),
      // ),
      body:
      CustomScrollView(
        slivers: [
          _buildAppbar(),
          _buildBox(),
          _buildStickBox(),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: _buildSliverGrid(),
          ),
          _buildSliverList(),
        ],
      ),
    );
  }

  Widget _buildBox() {
    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        color: Colors.amber,
      ),
    );
  }

  Widget _buildSliverList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
          _buildItemByIndex,
          childCount: data.length,
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

  Widget _buildStickBox() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: FixedPersistentHeaderDelegate(height: 54),
    );
  }

  Widget _buildAppbar() {
    return SliverAppBar(
      expandedHeight: 140,
      title: const Text('CustomScrollView 测试'),
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Image.asset(
              'assets/images/bg_10.webp',
              fit: BoxFit.cover)),
      // pinned: true,
      snap: true,
      floating: true,
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

class FixedPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  FixedPersistentHeaderDelegate({required this.height});

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return Container(
      height: height,
      alignment: Alignment.center,
      color: Colors.red,
      child: Text(
        'FixedPersistentHeader',
        // 'FixedPersistentHeader:${shrinkOffset.toStringAsFixed(1)}',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant FixedPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.height != height;
  }
}
