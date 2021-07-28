/// Flutter code sample for RestorationMixin

// This example demonstrates how to make a simple counter app restorable by
// using the [RestorationMixin] and a [RestorableInt].

import 'package:flutter/material.dart';


void main() => runApp(const RestorationExampleApp());

class RestorationExampleApp extends StatelessWidget {
  const RestorationExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      restorationScopeId: 'app',
      title: 'Restorable Counter',
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key, this.restorationId}) : super(key: key);

  final String? restorationId;

  @override
  State<Counter> createState() => _CounterState();
}

// The [State] object uses the [RestorationMixin] to make the current value
// of the counter restorable.
class _CounterState extends State<Counter> {

  int _counter = 0;


  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  // @override
  String? get restorationId => widget.restorationId;



  void _incrementCounter() {
    setState(() {
      // The current value of the property can be accessed and modified via
      // the value getter and setter.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restorable Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
