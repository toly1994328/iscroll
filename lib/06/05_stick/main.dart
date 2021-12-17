import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

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
    return
    Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppbar(),
          ...ItemData.testData.map(_buildGroup).toList()
        ],
      ),
    );
  }

  Widget _buildAppbar() {
    return SliverAppBar(
      expandedHeight: 140,
      title: const Text('SliverStickyHeader 测试'),
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background:
              Image.asset('assets/images/bg_10.webp', fit: BoxFit.cover)),
      pinned: true,
    );
  }

  Widget _buildItemByUser(String user) {
    return Container(
      alignment: Alignment.center,
      height: 56,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10.0),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/bg_10.webp'),
            ),
          ),
          Text(
            user,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildGroup(ItemData itemData) {
    return SliverStickyHeader(
      header: Container(
        alignment: Alignment.centerLeft,
        color: Color(0xffF6F6F6),
        padding: EdgeInsets.only(left: 20),
        height: 40,
        child: Text(itemData.groupName),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => _buildItemByUser(itemData.users[index]),
          childCount: itemData.users.length,
        ),
      ),
    );
  }
}

class ItemData {
  final String groupName;
  final List<String> users;

  ItemData({required this.groupName, this.users = const []});

  static List<ItemData> get testData => [
        ItemData(groupName: '幻将术士', users: ['梦小梦', '梦千']),
        ItemData(
            groupName: '幻将剑客', users: ['捷特', '龙少', '莫向阳', '何解连', '浪封', '梦飞烟']),
        ItemData(groupName: '幻将弓者', users: ['巫缨', '巫妻孋', '摄王', '裔王', '梦童']),
        ItemData(
            groupName: '其他', users: List.generate(20, (index) => '小兵$index')),
      ];
}
