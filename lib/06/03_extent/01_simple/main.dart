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
        title: const Text('CustomScrollView 测试'),
      ),
      body: CustomScrollView(
        slivers: [
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
    return SliverPersistentHeader(
      floating: true,
      delegate: ShowOnScreenSPHD(height: 60),
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
      delegate: FlexibleSPHD(min: 50, max: 150),
    );
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

class FlexibleSPHD extends SliverPersistentHeaderDelegate {
  final double max;
  final double min;

  FlexibleSPHD({required this.max, required this.min});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: Text(
        'FixedPersistentHeader',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(covariant FlexibleSPHD oldDelegate) {
    return oldDelegate.min != min || oldDelegate.max != max;
  }
}

class ShowOnScreenSPHD extends SliverPersistentHeaderDelegate {
  final double height;

  ShowOnScreenSPHD({required this.height});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height,
      alignment: Alignment.center,
      color: Colors.orange,
      child: Text(
        'ShowOnScreenSPHD',
        // 'FixedPersistentHeader:${shrinkOffset.toStringAsFixed(1)}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant ShowOnScreenSPHD oldDelegate) {
    return oldDelegate.height != height;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration {
    return PersistentHeaderShowOnScreenConfiguration(
      minShowOnScreenExtent: double.infinity,
    );
  }
}
