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

class _HomePageState extends State<HomePage> {
  final List<int> data = List.generate(60, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      CustomScrollView(
        slivers: [
          SliverOpacity(
            opacity: 0.5,
            sliver: _buildAppbar(),
          ),
          // _buildBox(),
          // SliverOpacity(
          //   opacity: 0.5,
          //   sliver: _buildStickBox(),
          // ),
          // _buildStickBox(),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: _buildSliverGrid(),
          ),
          // _buildSliverGrid(),
          SliverLayoutBuilder(builder: _builder),
          _buildSliverList(),
        ],
      ),
    );
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
    );
  }

  final TextStyle staticStyle =
      TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);

  Widget _builder(BuildContext context, SliverConstraints constraints) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 220,
            color: Colors.amber,
            child: Wrap(
              direction: Axis.vertical,
              spacing: 2,
              children: [
                Text('axisDirection:${constraints.axisDirection}', style: staticStyle,),
                Text('crossAxisDirection:${constraints.crossAxisDirection}', style: staticStyle),
                Text('growthDirection:${constraints.growthDirection}', style: staticStyle),
                Text('viewportMainAxisExtent:${constraints.viewportMainAxisExtent}', style: staticStyle),
                Text('crossAxisExtent:${constraints.crossAxisExtent}', style: staticStyle),
                Text('precedingScrollExtent:${constraints.precedingScrollExtent}', style: staticStyle),
                Text('userScrollDirection:${constraints.userScrollDirection}'),
                Text('remainingPaintExtent:${constraints.remainingPaintExtent}'),
                Text('remainingCacheExtent:${constraints.remainingCacheExtent}'),
                Text('overlap:${constraints.overlap}'),
                Text('cacheOrigin:${constraints.cacheOrigin}'),
                Text('scrollOffset:${constraints.scrollOffset}'),
              ],
            ),
          ),
          CustomPaint(
            painter: HelperPainter(constraints),
          )
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
      delegate: FixedPersistentHeaderDelegate(height: 50),
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

class HelperPainter extends CustomPainter {
  final SliverConstraints constraints;

  HelperPainter(this.constraints);

  TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center, textDirection: TextDirection.ltr);

  @override
  void paint(Canvas canvas, Size size) {
    // print(size);

    canvas.translate(constraints.crossAxisExtent, 0);
    // canvas.drawCircle(Offset.zero, 10, Paint()..color = Colors.red);

    Offset start = Offset(-20, 0);
    Offset end = Offset(-20, constraints.remainingPaintExtent);

    Path arrowPath = Path()
      ..moveTo(start.dx, start.dy)
      ..relativeLineTo(-5, 10)
      ..moveTo(start.dx, start.dy)
      ..relativeLineTo(5, 10)
      ..moveTo(start.dx, start.dy)
      ..relativeLineTo(0, constraints.remainingPaintExtent)
      ..moveTo(end.dx, end.dy)
      ..relativeLineTo(5, -10)
      ..moveTo(end.dx, end.dy)
      ..relativeLineTo(-5, -10);
    canvas.drawPath(
        arrowPath,
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);

    textPainter.text = TextSpan(
        text:
            'remainingPaintExtent:\n${constraints.remainingPaintExtent.toStringAsFixed(4)}',
        style: TextStyle(backgroundColor: Colors.red, color: Colors.white));
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset.zero.translate(
            -textPainter.width - 30, constraints.remainingPaintExtent / 2));

    Offset endP = Offset(20 - constraints.crossAxisExtent, 0);
    Offset startP = Offset(
        20 - constraints.crossAxisExtent, -constraints.precedingScrollExtent);

    Path arrowPathP = Path()
      ..moveTo(startP.dx, startP.dy)
      ..relativeLineTo(-5, 10)
      ..moveTo(startP.dx, startP.dy)
      ..relativeLineTo(5, 10)
      ..moveTo(startP.dx, startP.dy)
      ..relativeLineTo(0, constraints.precedingScrollExtent)
      ..moveTo(endP.dx, endP.dy)
      ..relativeLineTo(5, -10)
      ..moveTo(endP.dx, endP.dy)
      ..relativeLineTo(-5, -10);

    canvas.drawPath(
        arrowPathP,
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);

    textPainter.text = TextSpan(
        text:
            'precedingScrollExtent:\n${constraints.precedingScrollExtent.toStringAsFixed(4)}',
        style: TextStyle(backgroundColor: Colors.blue, color: Colors.white));
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset.zero.translate(-constraints.crossAxisExtent + 30,
            -constraints.precedingScrollExtent / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
