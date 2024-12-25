
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/logs/Logs.dart';

final counterProvider = StateNotifierProvider.autoDispose.family((ref, final int initialCount) {
  Log.d(message: 'Counter Provider is created.');
  ref.onDispose(() {
    Log.d(message: 'Counter Provider is disposed.');
  });
  return Counter(initialCount);
});

class Counter extends StateNotifier<CounterModel> {

  Counter(final int initialValue) : super(CounterModel(initialValue));

  CounterModel get count => state;

  void increaseBy1() => state = CounterModel(state.number+1);
}

class CounterModel {
  final int number;
  const CounterModel(this.number);
}
