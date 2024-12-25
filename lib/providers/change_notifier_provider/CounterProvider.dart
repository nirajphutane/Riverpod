
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/logs/Logs.dart';

final counterProvider = ChangeNotifierProvider.autoDispose.family((ref, final int initialCount) {
  Log.d(message: 'Counter Provider is created.');
  ref.onDispose(() {
    Log.d(message: 'Counter Provider is disposed.');
  });
  return Counter(initialCount);
});

class Counter extends ChangeNotifier {

  late int _counter;
  Counter(this._counter);

  CounterModel get count => CounterModel(_counter);

  void increaseBy1() {
    CounterModel(++_counter);
    notifyListeners();
  }
}

class CounterModel {
  final int number;
  const CounterModel(this.number);
}
