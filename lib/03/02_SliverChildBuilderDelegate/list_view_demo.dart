import 'dart:ui';

import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 60,
      itemBuilder: _buildItemByIndex,
    );
  }

  Widget _buildItemByIndex(BuildContext context, int index) {
    return ItemBox(index: index);
  }
}

class ItemBox extends StatefulWidget {
  final int index;

  ItemBox({Key? key, required this.index}) : super(key: key){
    print('=======ItemBox===构造触发====$index=====');
  }

  @override
  _ItemBoxState createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {
  @override
  void initState() {
    super.initState();
    print('-------_ItemBoxState#initState---${widget.index}--------');
  }

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
      child: ExcludeSemantics(
        child: Text(
          '第 ${widget.index} 个',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

