import 'dart:ui';

import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollNotification>(
      onNotification: _onNotification,
      child: ListView(
          children: List.generate(
              60,
              (index) => ItemBox(
                    index: index,
                  )).toList()),
    );
  }

  bool _onNotification(OverscrollNotification notification) {
    print('====dragDetails:${notification.dragDetails}'
        '====pixels:${notification.metrics.pixels}=====overscroll:${notification.overscroll}');
    return false;
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
