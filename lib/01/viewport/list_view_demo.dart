import 'dart:ui';

import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 250,
      child: ListView(
        // padding: EdgeInsets.zero,
          // itemExtent: 15, //<--- tag1
          children: List.generate(
              60,
              (index) => ItemBox(
                    index: index,
                  )).toList()),
    );
  }
}

class ItemBox extends StatelessWidget {
  final int index;

  const ItemBox({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue.withOpacity((index%10+1)*10/100),
      // decoration: BoxDecoration(
      //     border: Border(
      //         bottom: BorderSide(
      //   width: 1 / window.devicePixelRatio,
      // ))),
      height: 56,
      child: Text(
        '第 $index 个',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}