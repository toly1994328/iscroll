import 'dart:ui';

import 'package:flutter/material.dart';

class ScrollbarDemo extends StatelessWidget {
  const ScrollbarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      notificationPredicate: _notificationPredicate,
      // interactive: true,
      // interactive: false,
      child: ListView(
          children:
              List.generate(60, (index) => ItemBox(index: index)).toList()),
    );
  }

  bool _notificationPredicate(ScrollNotification notification) {
    print('----$notification---------');
    return true;
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
