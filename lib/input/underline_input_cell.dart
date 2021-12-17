import 'dart:async';

import 'package:flutter/material.dart';

class UnderlineInputCell extends StatefulWidget {
  final bool isFocused;
  final String text;

  const UnderlineInputCell({Key? key, this.isFocused=false, this.text=''}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UnderlineInputCellState();
}

class _UnderlineInputCellState extends State<UnderlineInputCell> {
  //聚焦还是未聚焦都是一样的格子
  var cell;

  @override
  Widget build(BuildContext context) {
    cell = Center(
      child: Text(
        widget.text,
        style: TextStyle(fontSize: 22),
      ),
    );

    return Container(
      width: 30,
      height: 45,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: widget.isFocused ? Colors.blue:Colors.black54,
              width: 2
            ),)
      ),
      child: cell,
    );
  }
}