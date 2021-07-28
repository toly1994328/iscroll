import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {

  ScrollController scrollController =ScrollController();

  @override
  void initState() {

    super.initState();
    scrollController..addListener(() {
      print(scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {


    return  GestureDetector(
      onTap: _onTap,
      child: ListView(
        controller: scrollController,
            dragStartBehavior: DragStartBehavior.down,
            children: List.generate(
                25,
                (index) => ItemBox(
                      index: index,
                    )).toList(),
      ),
    );
  }


  void _onTap() {
  }
}

class ItemBox extends StatelessWidget {
  final int index;

  const ItemBox({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 1 / window.devicePixelRatio,
      ))),
      height: 56,
      child: Text(
        '第 $index 个',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
