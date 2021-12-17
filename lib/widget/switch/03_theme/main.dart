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
          switchTheme: SwitchTheme.of(context).copyWith(
            thumbColor: MaterialStateProperty.resolveWith<Color>(getThumbColor),
          )
      ),
      home: HomePage(),
    );
  }

  Color getThumbColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return Colors.white;
    }
    if (states.contains(MaterialState.disabled)) {
      return Colors.red;
    }
    if (states.contains(MaterialState.focused)) {
      return Colors.purple;
    }
    if (states.contains(MaterialState.hovered)) {
      return Colors.black54;
    }
    return Colors.black;
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
    return
      Switch(
        // inactiveThumbImage: AssetImage('assets/images/icon_8.jpg'),
        // inactiveThumbColor: Colors.blueGrey,
        // thumbColor: MaterialStateProperty.resolveWith<Color>(getThumbColor),
        value: _value,
        onChanged: _onChanged,
      );
  }

  Color getThumbColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return Colors.orange;
    }
    if (states.contains(MaterialState.disabled)) {
      return Colors.red;
    }
    if (states.contains(MaterialState.focused)) {
      return Colors.purple;
    }
    if (states.contains(MaterialState.hovered)) {
      return Colors.yellow;
    }
    return Colors.amberAccent;
  }

  Color getTrackColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return Colors.purpleAccent;
    }
    if (states.contains(MaterialState.disabled)) {
      return Colors.black;
    }
    if (states.contains(MaterialState.focused)) {
      return Colors.purple;
    }
    if (states.contains(MaterialState.hovered)) {
      return Colors.pinkAccent;
    }
    return Colors.grey;
  }

  void _onChanged(bool value) {
    setState(() {
      _value = value;
    });
  }
}
