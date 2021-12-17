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
      delegate: FixedPersistentHeaderDelegate(height: 54),
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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height,
      alignment: Alignment.center,
      color: Colors.red,
      child: Text(
        'FixedPersistentHeader1',
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

//import 'dart:math';
// import 'package:flutter/material.dart';
// class SliverPersistentHeaderDemo extends StatelessWidget {
//   final data = <Color>[
//     Colors.purple[50],
//     Colors.purple[100],
//     Colors.purple[200],
//     Colors.purple[300],
//     Colors.purple[400],
//     Colors.purple[500],
//     Colors.purple[600],
//     Colors.purple[700],
//     Colors.purple[800],
//     Colors.purple[900],
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       child: CustomScrollView(
//         slivers: <Widget>[
//           _buildSliverAppBar(),
//           _buildPersistentHeader('袅缈岁月，青丝银发',Color(0xffe7fcc9)),
//           _buildCommonWidget(),
//           _buildPersistentHeader('以梦为马，不负韶华',Color(0xffcca4ff)),
//           _buildSliverList()
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCommonWidget() => SliverToBoxAdapter(
//     child: Container(
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       color: Colors.grey.withAlpha(22),
//       child: ListTile(
//         leading: Image.asset("assets/images/icon_head.webp"),
//         title: Text("以梦为马"),
//         subtitle: Text("海子"),
//         selected: true,
//         contentPadding: EdgeInsets.all(5),
//         trailing: Icon(Icons.more_vert),
//       ),
//     ),
//   );
//   Widget _buildPersistentHeader(String text,Color color) => SliverPersistentHeader(
//     pinned: true,
//     delegate: _SliverDelegate(
//         minHeight: 40.0,
//         maxHeight: 100.0,
//         child: Container(
//           color: color,
//           child: Center(
//             child: Text(text, style: TextStyle(
//                 fontSize: 18,
//                 shadows: [Shadow(color: Colors.white, offset: Offset(1, 1))]),
//           ),
//         )),
//   ));
//
//   Widget _buildSliverList() => SliverList(
//     delegate: SliverChildBuilderDelegate(
//             (_, int index) => Container(
//           alignment: Alignment.center,
//           width: 100,
//           height: 60,
//           color: data[index],
//           child: Text(
//             colorString(data[index]),
//             style: TextStyle(color: Colors.white, shadows: [
//               Shadow(
//                   color: Colors.black,
//                   offset: Offset(.5, .5),
//                   blurRadius: 2)
//             ]),
//           ),
//         ),
//         childCount: data.length),
//   );
//
//   Widget _buildSliverAppBar() {
//     return SliverAppBar(
//       expandedHeight: 190.0,
//       leading: _buildLeading(),
//       title: Text('张风捷特烈'),
//       actions: _buildActions(),
//       elevation: 2,
//       pinned: true,
//       backgroundColor: Colors.orange,
//       flexibleSpace:
//
//       FlexibleSpaceBar(
//         //伸展处布局
//         titlePadding: EdgeInsets.only(left: 55, bottom: 15), //标题边距
//         collapseMode: CollapseMode.parallax, //视差效果
//         background: Image.asset(
//           "assets/images/caver.webp",
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLeading() => Container(
//       margin: EdgeInsets.all(10),
//       child: Image.asset('assets/images/icon_head.webp'));
//
//   List<Widget> _buildActions() => <Widget>[
//     IconButton(
//       onPressed: () {},
//       icon: Icon(
//         Icons.star_border,
//         color: Colors.white,
//       ),
//     )
//   ];
//
//   String colorString(Color color) =>
//       "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
// }
//
//
// class _SliverDelegate extends SliverPersistentHeaderDelegate {
//   _SliverDelegate({
//     @required this.minHeight,
//     @required this.maxHeight,
//     @required this.child,
//   });
//
//   final double minHeight; //最小高度
//   final double maxHeight; //最大高度
//   final Widget child; //孩子
//
//   @override
//   double get minExtent => minHeight;
//
//   @override
//   double get maxExtent => max(maxHeight, minHeight);
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return new SizedBox.expand(child: child);
//   }
//
//   @override //是否需要重建
//   bool shouldRebuild(_SliverDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }