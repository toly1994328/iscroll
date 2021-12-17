import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:iscroll/08_nest/00/sliver/sliver_snap_header.dart';

import 'sliver/sliver_pinned_header.dart';
import 'views/search_bar.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = <String>['关注', '推荐', '热榜', '精选'];
    return DefaultTabController(
      length: _tabs.length, // This is the number of tabs.
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).padding.top,
            ),
            Expanded(
              child: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  // These are the slivers that show up in the "outer" scroll view.
                  return <Widget>[
                    // SilverStatusBarHolder(),
                    SliverSnapHeader(
                      child: SearchBar(),
                    ),
                    SliverPinnedHeader(
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        // indicatorColor: Colors.red,
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.blue,
                        // // These are the widgets to put in each tab in the tab bar.
                        tabs: _tabs
                            .map((String name) => Tab(text: name))
                            .toList(),
                      ),
                    ),

                    // SliverToBoxAdapter(
                    //   child:
                    //   TabBar(
                    //     // These are the widgets to put in each tab in the tab bar.
                    //     tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                    //   ),
                    // ),
                    // SliverPersistentHeader(
                    //   floating: true,
                    //   delegate: ShowOnScreenSPHD(height: 60),
                    // ),
                    // SliverAppBar(
                    //   title: const Text('Books'),
                    //   // This is the title in the app bar.
                    //   pinned: false,
                    //   floating: true,
                    //   snap: true,
                    //   // expandedHeight: 150.0,
                    //   // The "forceElevated" property causes the SliverAppBar to show
                    //   // a shadow. The "innerBoxIsScrolled" parameter is true when the
                    //   // inner scroll view is scrolled beyond its "zero" point, i.e.
                    //   // when it appears to be scrolled below the SliverAppBar.
                    //   // Without this, there are cases where the shadow would appear
                    //   // or not appear inappropriately, because the SliverAppBar is
                    //   // not actually aware of the precise position of the inner
                    //   // scroll views.
                    //   forceElevated: innerBoxIsScrolled,
                    //   bottom:
                    //   TabBar(
                    //     // These are the widgets to put in each tab in the tab bar.
                    //     tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                    //   ),
                    // ),
                  ];
                },
                body: TabBarView(
                  // These are the contents of the tab views, below the tabs.
                  children: _tabs.map((String name) {
                    return Builder(
                      // This Builder is needed to provide a BuildContext that is
                      // "inside" the NestedScrollView, so that
                      // sliverOverlapAbsorberHandleFor() can find the
                      // NestedScrollView.
                      builder: (BuildContext context) {
                        return CustomScrollView(
                          // The "controller" and "primary" members should be left
                          // unset, so that the NestedScrollView can control this
                          // inner scroll view.
                          // If the "controller" property is set, then this scroll
                          // view will not be associated with the NestedScrollView.
                          // The PageStorageKey should be unique to this ScrollView;
                          // it allows the list to remember its scroll position when
                          // the tab view is not on the screen.
                          // key: PageStorageKey<String>(name),
                          slivers: <Widget>[
                            // SliverOverlapInjector(
                            //   // This is the flip side of the SliverOverlapAbsorber
                            //   // above.
                            //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                            // ),
                            // _buildBox(),
                            // CupertinoSliverRefreshControl(),

                            SliverPadding(
                              padding: const EdgeInsets.all(8.0),
                              // In this example, the inner scroll view has
                              // fixed-height list items, hence the use of
                              // SliverFixedExtentList. However, one could use any
                              // sliver widget here, e.g. SliverList or SliverGrid.
                              sliver: SliverFixedExtentList(
                                // The items in this example are fixed to 48 pixels
                                // high. This matches the Material Design spec for
                                // ListTile widgets.
                                itemExtent: 48.0,
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    // This builder is called for each child.
                                    // In this example, we just number each list item.
                                    return ListTile(
                                      title: Text('Item $index'),
                                    );
                                  },
                                  // The childCount of the SliverChildBuilderDelegate
                                  // specifies how many children this inner list
                                  // has. In this example, each tab has a list of
                                  // exactly 30 items, but this is arbitrary.
                                  childCount: 30,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
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
}
