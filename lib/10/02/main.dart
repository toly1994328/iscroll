import 'package:flutter/cupertino.dart';
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

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<String> _tabs = <String>['最新文章', '我的关注'];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  Widget _buildAppbar() {
    return SliverAppBar(
      expandedHeight: 140,
      title: const Text('CustomScrollView 测试'),
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background:
              Image.asset('assets/images/bg_10.webp', fit: BoxFit.cover)),
      pinned: true,
      bottom: TabBar(
        controller: tabController,
        tabs: _tabs.map((String name) => Tab(text: name)).toList(),
      ),
    );
  }


  Widget buildScrollPage(Color color) {
    return CustomScrollView(
      slivers: [
        _buildBox(color),
        SliverPadding(
          padding: EdgeInsets.all(8),
          sliver: _buildSliverGrid(),
        ),
        _buildSliverList(),
      ],
    );
  }

  final List<int> data = List.generate(60, (index) => index + 1);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: _buildHeader,
      body: TabBarView(
        controller: tabController,
        children: [
          buildScrollPage(Colors.red),
          buildScrollPage(Colors.amber),
        ],
      ),
    ));
  }

  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    return [
      _buildAppbar(),
    ];
  }

  Widget _buildBox(Color color) {
    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        color: color,
      ),
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
