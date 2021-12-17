import 'dart:ui';

import 'package:flutter/material.dart';

class ScrollbarDemo extends StatelessWidget {
  const ScrollbarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
   Scrollbar(
      isAlwaysShown: true,
      radius: const Radius.circular(3),
      thickness: 6,
      child: ListView(
          children:
              List.generate(60,
                      (index) => ItemBox(index: index)).toList()),
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
