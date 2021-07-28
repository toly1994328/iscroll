import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> with RestorationMixin {
  @override
  String get restorationId => 'count';

  RestorableInt _counter = RestorableInt(0);

  @override
  void restoreState(RestorationBucket? oldBucket, bool value) =>
      registerForRestoration(_counter, 'count');

  void _incrementCounter() => setState(() => _counter.value++);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: Text('${_counter.value}')),
        floatingActionButton:
            FloatingActionButton(onPressed: _incrementCounter),
      );
}
