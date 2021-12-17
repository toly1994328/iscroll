import 'dart:ui';

import 'package:flutter/material.dart';

class ScrollbarDemo extends StatefulWidget {
  const ScrollbarDemo({Key? key}) : super(key: key);

  @override
  _ScrollbarDemoState createState() => _ScrollbarDemoState();
}

class _ScrollbarDemoState extends State<ScrollbarDemo> {

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return
      // Stack(
      // children: [
      //   Scrollbar(
      //     controller:controller ,
      //     child:
          ListView(
            controller: controller,
              children:
                  List.generate(60, (index) => ItemBox(index: index)).toList()
          // ),
      //   ),
      //   Positioned(
      //       bottom: 20,
      //       right: 20,
      //       child: GestureDetector(
      //         behavior:HitTestBehavior.opaque,
      //         onTap: (){
      //           // print('=======');
      //           controller.jumpTo(300);
      //         },
      //         child: Icon(
      //           Icons.move_to_inbox,
      //           size: 40,
      //           color: Colors.blue,
      //         ),
      //       )),
      // ],
    );
  }

  // bool _notificationPredicate(ScrollNotification notification) {
  //   print('----$notification---------');
  //   return true;
  // }
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
