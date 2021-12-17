import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // debugShowMaterialGrid: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('ListView 基础测试'),),
      body: Center(
        child: SwitchDemo(),
      ),
    );
  }
}

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({Key? key}) : super(key: key);

  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _disable = false;

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildOutSwitch(),
            TickerMode(
                enabled: !_disable,
                child: buildTestContent()),
          ],
        );
  }

  Widget buildOutSwitch() => Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children:[
              Text('TickerMode外的Switch:'),
              Switch(
              value: _disable,
              onChanged: _onChanged,
            )] ,
          );

  Widget buildTestContent() => Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20,
      children: [
        Switch(
          value: _disable,
          onChanged: _onChanged,
        ),
        CupertinoActivityIndicator(),
        CircularProgressIndicator(),
      ],
    );

  void _onChanged(bool value) {
    setState(() {
      _disable = value;
    });
  }
}
