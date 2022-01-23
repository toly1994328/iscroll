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

  final List<int> data = List.generate(68, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KeepAlive 测试'),
      ),
      body: Scrollable(
        viewportBuilder: _buildViewPort,
      ),
    );
  }

  Widget _buildViewPort(BuildContext context, ViewportOffset position) {
    return Viewport(
      offset: position,
      slivers: [
        _buildSliverList()
      ],
    );
  }

  Widget _buildSliverList() {
    List<Widget> children = data.map((index) =>
        ItemBox(index: index,)).toList();

    // return SliverList(
    //     delegate: SliverChildListDelegate(
    //       children,
    //     ));

    return
      SliverList(
        delegate: SliverChildBuilderDelegate(
              (_,index){
                return ItemBox(index: data[index]);
              },
          childCount: data.length,
      ));
  }


}

class ItemBox extends StatefulWidget {
  final int index;

  ItemBox({Key? key, required this.index,});

  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> with AutomaticKeepAliveClientMixin{
  Color get color => Colors.blue.withOpacity((widget.index % 10) * 0.1);

  @override
  void initState() {
    super.initState();
    print('初始化状态:第 ${widget.index} 个');
  }

  @override
  void dispose() {
    print('销毁状态:第 ${widget.index} 个');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('----构建ItemBox-----${widget.index}--------');
    return Container(
      alignment: Alignment.center,
      color: color,
      height: 56,
      child: Text(
        '第 ${widget.index} 个',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
  // bool get wantKeepAlive => false;
}
