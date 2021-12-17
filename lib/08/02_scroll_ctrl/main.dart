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

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> data = List.generate(60, (index) => index + 1);
  final ScrollController _ctrl = ScrollController();

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(listenScroll);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void listenScroll() {
    print('======offset:${_ctrl.offset}================');
    print(
        '======maxScrollExtent:${_ctrl.position.maxScrollExtent}================');
    print(
        '======userScrollDirection:${_ctrl.position.userScrollDirection}================');
    print(
        '======axisDirection:${_ctrl.position.axisDirection}================');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrollable#controller'),
        actions: [
          IconButton(
              onPressed: () {
                _ctrl.jumpTo(0);
              },
              icon: Icon(Icons.vertical_align_top))
        ],
      ),
      body: Scrollable(
        controller: _ctrl,
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
