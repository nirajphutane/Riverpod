
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logs/Logs.dart';

final counterProvider = NotifierProvider.autoDispose<Counter, CounterModel>(Counter.new);

class Counter extends AutoDisposeNotifier<CounterModel> {

  void increaseBy1() => state = CounterModel(state.number+1);

  @override
  CounterModel build() {
    Log.d(message: 'Counter Provider is created.');
    ref.onDispose(() {
      Log.d(message: 'Counter Provider is disposed.');
    });
    return const CounterModel(0);
  }
}

class CounterModel {
  final int number;
  const CounterModel(this.number);
}
