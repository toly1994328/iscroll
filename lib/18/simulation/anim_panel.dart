import 'dart:ui';

import 'package:flutter/material.dart';

import 'anim_painter.dart';
import 'point_data.dart';

class AnimPanel extends StatefulWidget {
  @override
  _AnimPanelState createState() => _AnimPanelState();
}

class _AnimPanelState extends State<AnimPanel>
    with SingleTickerProviderStateMixin {
  PointData points = PointData();

  late AnimationController _ctrl;

  final Duration animDuration = const Duration(milliseconds: 1000);

  static final Tolerance _kDefaultTolerance = Tolerance(
    velocity: 1.0 / (0.050 * WidgetsBinding.instance.window.devicePixelRatio),
    // logical pixels per second
    distance: 1.0 /
        WidgetsBinding.instance.window.devicePixelRatio, // logical pixels
  );

  TextEditingController _speedCtrl = TextEditingController(text: '1000');
  TextEditingController _frictionCtrl = TextEditingController(text: '0.015');

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController.unbounded(
      vsync: this,
    )..addListener(_collectPoint);

  }

  @override
  void dispose() {
    _ctrl.dispose();
    points.dispose();
    super.dispose();
  }

  void _collectPoint() {
    points.push(_ctrl.value/1000);
  }

  void _startAnim() async{
    points.clear();
    print('start!---${DateTime.now().toIso8601String()}----------');
    final Simulation simulation = ClampingScrollSimulation(
      position: 100,
      velocity: double.tryParse(_speedCtrl.text)??0.0151000,
      friction: double.tryParse(_frictionCtrl.text)??0.015,
      tolerance: _kDefaultTolerance,
    );
    await _ctrl.animateWith(simulation);
    print('done!---${DateTime.now().toIso8601String()}----------');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Expanded(child:
          Container(
             padding: EdgeInsets.symmetric(horizontal: 80),
              child: ElevatedButton(onPressed: _startAnim, child: Text('启动动画'))),),
        CustomPaint(
          painter: AnimPainter(points),
          size: const Size(
            200,
            200,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSpeedInput(),
              const SizedBox(height: 10),
              buildFrictionInput(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSpeedInput() => Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text('初速度:'),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        controller: _speedCtrl,
                        keyboardType: TextInputType.number,
                          decoration:InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(top: 0,left: 10),
                            hintText: '请输入初速度',
                            hintStyle: TextStyle(fontSize: 14)
                          )
                      ),
                    ),
                  ],
                ));

  Widget buildFrictionInput() => Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text('摩擦力:'),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _frictionCtrl,
                          decoration:InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(top: 0,left: 10),
                            hintText: '请输入初速度',
                            hintStyle: TextStyle(fontSize: 14)
                          )
                      ),
                    ),
                  ],
                ));
}


