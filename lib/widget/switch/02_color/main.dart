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
  bool _value = false;

 static const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };

  @override
  Widget build(BuildContext context) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    return
    Switch(
      activeColor: Colors.blue,
      thumbColor: MaterialStateProperty.resolveWith<Color>(getColor),
      activeThumbImage: AssetImage('assets/images/icon_head.png'),
      inactiveThumbImage: AssetImage('assets/images/icon_8.jpg'),
      activeTrackColor: Colors.green,
      inactiveThumbColor: Colors.orange,
      inactiveTrackColor: Colors.pinkAccent,
      hoverColor: Colors.blue.withOpacity(0.2),
      mouseCursor: SystemMouseCursors.move,
      splashRadius: 15,
      value: _value,
      onChanged: _onChanged,
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
      MaterialState.hovered,
      MaterialState.focused,
      MaterialState.disabled,
    };

    if (states.contains(MaterialState.selected)) {
      return Colors.blue;
    }
    if (states.contains(MaterialState.selected)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  void _onChanged(bool value) {
    setState(() {
      _value = value;
    });
  }
}
