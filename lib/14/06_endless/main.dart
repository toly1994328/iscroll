import 'package:flutter/material.dart';

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
  ValueNotifier<int> activePageIndex = ValueNotifier<int>(0);

  static const int _kIndexOffset = 10000; // 初始索引偏移量
  int _realIndex = 0; // 真实索引
  late PageController _ctrl; // 滑动控制器

  int get initOffsetIndex => (_kIndexOffset~/imgPaths.length+1)*imgPaths.length;

  @override
  void initState() {
    super.initState();
    _realIndex = initOffsetIndex + _realIndex;
    _ctrl = PageController(
      initialPage: _realIndex,
    );
  }

  final List<String> imgPaths = [
    'assets/images/bg/bg1.webp',
    'assets/images/bg/bg2.webp',
    'assets/images/bg/bg3.webp',
    'assets/images/bg/bg4.webp',
    'assets/images/bg/bg5.webp',
    'assets/images/bg/bg6.webp',
  ];

  int get currentPage{
    final int offsetIndex = _realIndex - initOffsetIndex;
    return offsetIndex % imgPaths.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView 测试'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 180,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                PageView.builder(
                  onPageChanged: (int page) {
                    _realIndex = page;
                    activePageIndex.value = currentPage;
                  },
                  controller: _ctrl,
                  itemBuilder: _buildItemByIndex,
                  // controller: controller,
                ),
              ),
              Positioned(
                bottom: 10,
                child: ValueListenableBuilder(
                  valueListenable: activePageIndex,
                  builder: (_, int pageIndex, __) => PageIndicator(
                    length: imgPaths.length,
                    activeIndex: pageIndex,
                    size: 5,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: ValueListenableBuilder(
                  valueListenable: activePageIndex,
                  builder: (_, int pageIndex, __) => Text(
                    '${pageIndex + 1}/${imgPaths.length}',
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemByIndex(BuildContext context, int index) {
    return Image.asset(
      imgPaths[index%imgPaths.length],
      fit: BoxFit.cover,
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int length;
  final int activeIndex;
  final double size;

  const PageIndicator(
      {Key? key,
      required this.length,
      required this.activeIndex,
      this.size = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: size,
      children: List.generate(length, (index) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: activeIndex == index
                  ? Colors.white
                  : Colors.grey.withOpacity(0.8)),
        );
      }),
    );
  }
}
