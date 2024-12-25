
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logs/Logs.dart';

final counterProvider = NotifierProvider.autoDispose.family<Counter, CounterModel, int>(Counter.new);

class Counter extends AutoDisposeFamilyNotifier<CounterModel, int> {

  void increaseBy1() => state = CounterModel(state.number+1);

  @override
  CounterModel build(final int arg) {
    Log.d(message: 'Counter Provider is created.');
    ref.onDispose(() {
      Log.d(message: 'Counter Provider is disposed.');
    });
    return CounterModel(arg);
  }

}

class CounterModel {
  final int number;
  const CounterModel(this.number);
}
