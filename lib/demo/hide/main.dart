import 'package:flutter/material.dart';
import 'package:iscroll/demo/hide/hide_flow.dart';

main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HideFlowTest(),
  ));
}

class HideFlowTest extends StatefulWidget {
  const HideFlowTest({Key? key}) : super(key: key);

  @override
  _HideFlowTestState createState() => _HideFlowTestState();
}

class _HideFlowTestState extends State<HideFlowTest> {
  final LayerLink layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
            body: HideFlow(
                layerLink: layerLink,
                top: Container(
                  height: 30,
                  color: Colors.blue,
                ),
                content: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                ),
                bottom: Container(
                  margin: EdgeInsets.only(bottom:MediaQuery.of(context).padding.top ),
                  height: 30,
                  color: Colors.red,
                )),
      ),
    );
  }
}
