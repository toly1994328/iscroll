import 'package:flutter/material.dart';

void main() => runApp(const RestorationExampleApp());

class RestorationExampleApp extends StatelessWidget {
  const RestorationExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      restorationScopeId: 'app',
      title: 'Restorable Counter',
      home: RestorableCounter(
        restorationId: 'counter',
      ),
    );
  }
}

class RestorableCounter extends StatefulWidget {
  const RestorableCounter({Key? key, this.restorationId}) : super(key: key);
  final String? restorationId;

  @override
  State<RestorableCounter> createState() => _RestorableCounterState();
}

class _RestorableCounterState extends State<RestorableCounter>
    with RestorationMixin {
  // 1. 混入 RestorationMixin

  // 3. 使用 RestorableInt 对象记录数值
  final RestorableInt _counter = RestorableInt(0);

  // 2. 覆写 restorationId 提供 id
  // @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // 4. 注册 _counter
    registerForRestoration(_counter, 'count');
  }

  @override
  void dispose() {
    _counter.dispose(); // 5. 销毁
    super.dispose();
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
            const Text('You have pushed the button this many times:'),
            Text(
              '${_counter.value}',
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

  void _incrementCounter() {
    setState(() {
      _counter.value++;
    });
  }
}
