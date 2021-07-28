import 'dart:ui';

import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            60,
            (index) => ItemBox(
                  index: index,
                )).toList());
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
              right: BorderSide(
        width: 1 / window.devicePixelRatio,
      ))),
      width: 80,
      child: Text(
        '第 $index 个',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
