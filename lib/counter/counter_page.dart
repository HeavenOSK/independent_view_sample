import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:independent_view_sample/counter/count_controller.dart';

class CounterPage extends HookWidget {
  CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = useProvider(
      counterControllerProvider.state.select((value) => value.loading),
    );
    final controller = useProvider(counterControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter '),
        actions: [
          RaisedButton(
            onPressed: () {
              controller.save();
            },
            child: Text('Save'),
          ),
        ],
      ),
      body: loading ? Center(child: CircularProgressIndicator()) : _Content(),
      floatingActionButton: loading
          ? SizedBox.shrink()
          : FloatingActionButton(
              onPressed: controller.increment,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
    );
  }
}

class _Content extends HookWidget {
  const _Content({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = useProvider(
      counterControllerProvider.state.select((value) => value.count),
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
