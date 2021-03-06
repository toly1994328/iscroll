import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/viewport_offset.dart';

class ScrollableTest extends StatelessWidget {
  const ScrollableTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollable(viewportBuilder: _buildViewport);
  }

  Widget _buildViewport(BuildContext context, ViewportOffset position) {
    return Viewport(
      offset: position,
      slivers: [
        buildSliverGrid(),
        buildSliverList(),
        buildSliverGrid(),
      ],
    );
  }

  Widget buildSliverGrid() => SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8
    ),
      delegate: SliverChildBuilderDelegate(
            (_, index) => Container(color: Colors.purple,),
        childCount: 8,
      ));

  Widget buildSliverList() => SliverList(
          delegate: SliverChildBuilderDelegate(
        (_, index) => ItemBox(index: index),
        childCount: 20,
      ));
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
