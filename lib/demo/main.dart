import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Test(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  int currIndex = 0;

  @override
  void initState() {
    super.initState();
    this._tabController = TabController(length: 2, vsync: this);
    this._pageController = PageController(initialPage: currIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
                expandedHeight: 310,
                pinned: true,
                floating: false,
                leading: null,
                title: Center(child: Text("渐变头部")),
                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Image.network(
                        'https://img.zcool.cn/community/01c6615d3ae047a8012187f447cfef.jpg@1280w_1l_2o_100sh.jpg',
                        fit: BoxFit.cover)),
                bottom: PreferredSize(
                  child: Container(
                    color: Colors.black,
                    child: TabBar(
                      labelStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      unselectedLabelStyle: TextStyle(fontSize: 14),
                      controller: _tabController,
                      tabs: <Widget>[
                        Tab(text: 'Home'),
                        Tab(text: 'Profile'),
                      ],
                      // 点击item
                      onTap: (int index) {
                        this.currIndex = index;
                        _pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                      },
                    ),
                  ),
                  preferredSize: Size.fromHeight(50),
                ),
              ),
            ),
          ],
          body: Builder(
            builder: (ctx) {
              return PageView(
                controller: _pageController,
                children: <Widget>[
                  CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(ctx),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return  Container(
                                height: 55,
                                child: Center(
                                  child: Text(
                                    "item:$index",
                                  ),
                                ),
                            );
                          },
                          childCount: 1000,
                          addAutomaticKeepAlives: true,
                          addRepaintBoundaries: true,
                          addSemanticIndexes: true,
                        ),
                      )
                    ],
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(ctx),
                      ),
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return  Container(
                              height: 55,
                              child: Center(
                                child: Text(
                                  "item:$index",
                                ),
                              ),
                            );
                          },
                          childCount: 1000,
                          addAutomaticKeepAlives: true,
                          addRepaintBoundaries: true,
                          addSemanticIndexes: true,
                        ),
                      )
                    ],
                  ),
                ],
                physics: PageScrollPhysics(),
              );
            }
          ),
        ),
      ),
    );
  }
}
