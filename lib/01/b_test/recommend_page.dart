import 'package:flutter/material.dart';

// class RecommendPage extends StatelessWidget {
//   const RecommendPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class SliverPersistentHeaderDemo extends StatelessWidget {
  // 色彩数据
  final List<Color> data = List.generate(24, (i) => Color(0xFFFF00FF - 24 * i));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 60,
          //     color: Colors.purple,
          //   ),
          // ),
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/icon_8.jpg'),
              ),
            ),
          ),
          // SliverPersistentHeader(
          //     pinned: true, delegate: UnitPersistentHeaderDelegate2(
          //   maxHeight: 80,
          //   minHeight: MediaQuery.of(context).padding.top
          // )),
          SliverPersistentHeader(
              pinned: true, delegate: UnitPersistentHeaderDelegate()),
          _buildSliverList()
        ],
      ),
    );
  }

  // 构建颜色列表
  Widget _buildSliverList() => SliverList(
        delegate: SliverChildBuilderDelegate(
            (_, int index) => _buildColorItem(data[index]),
            childCount: data.length),
      );

  // 构建颜色列表item
  Widget _buildColorItem(Color color) => Card(
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 60,
          color: color,
          child: Text(
            colorString(color),
            style: const TextStyle(color: Colors.white, shadows: [
              Shadow(color: Colors.black, offset: Offset(.5, .5), blurRadius: 2)
            ]),
          ),
        ),
      );

  // 颜色转换为文字
  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
}

class UnitPersistentHeaderDelegate2 extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;

  UnitPersistentHeaderDelegate2({this.maxHeight = 60, this.minHeight = 60});


  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(
        "=====shrinkOffset:$shrinkOffset======overlapsContent:$overlapsContent====");
    final String info = 'shrinkOffset:${shrinkOffset.toStringAsFixed(1)}'
        '\noverlapsContent:$overlapsContent';
    return Container(
      alignment: Alignment.center,
      color: Colors.purple,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/icon_8.jpg'),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant UnitPersistentHeaderDelegate2 oldDelegate) =>
      oldDelegate.maxHeight != maxHeight || oldDelegate.minHeight != minHeight;
}


class UnitPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;

  UnitPersistentHeaderDelegate({this.maxHeight = 60, this.minHeight = 60});


  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(
        "=====shrinkOffset:$shrinkOffset======overlapsContent:$overlapsContent====");
    final String info = 'shrinkOffset:${shrinkOffset.toStringAsFixed(1)}'
        '\noverlapsContent:$overlapsContent';
    return Container(
      alignment: Alignment.center,
      color: Colors.orangeAccent,
      child: Text(
        info,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant UnitPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxHeight != maxHeight || oldDelegate.minHeight != minHeight;
}

class RecommendPage extends StatelessWidget {
  const RecommendPage({Key? key}) : super(key: key);

  static const _tabs = ['风神传', '封妖志', "幻将录", "永恒传说"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                // title: const Text('旷古奇书'),
                pinned: false,
                elevation: 6,
                //影深
                // expandedHeight: 96.0,
                forceElevated: innerBoxIsScrolled,
                //为true时展开有阴影
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/bg_6.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: TabBar(
                  tabs: _tabs
                      .map((String name) => Tab(
                            text: name,
                          ))
                      .toList(),
                ),
              ),
            ),
          ];
        },
        body: _buildTabBarView(),
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: _tabs.map((String name) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (BuildContext context) {
              return CustomScrollView(
                key: PageStorageKey<String>(name),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverFixedExtentList(
                      itemExtent: 48.0,
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ListTile(
                            title: Text('《$name》 第 $index章'),
                          );
                        },
                        childCount: 50,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
