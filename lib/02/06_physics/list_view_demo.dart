import 'dart:ui';

import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        // physics: const ScrollPhysics(),
        // physics: const PageScrollPhysics(),
        // physics: const FixedExtentScrollPhysics(),
        physics: const ClampingScrollPhysics(),
        // physics: const BouncingScrollPhysics(),
        // physics: const RangeMaintainingScrollPhysics(),
        // physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        children: List.generate(
            25,
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
