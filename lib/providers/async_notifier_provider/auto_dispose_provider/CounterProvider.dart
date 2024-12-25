
import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logs/Logs.dart';

final counterProvider = AsyncNotifierProvider.autoDispose<Counter, CounterModel>(Counter.new);

class Counter extends AutoDisposeAsyncNotifier<CounterModel> {

  void increaseBy1() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => _increaseBy1(state.value!.number));
  }

  // void increaseBy1() async {
  //   try {
  //     state = const AsyncLoading();
  //     state = AsyncData(await _increaseBy1(state.value!.number));
  //   } catch (error, stackTrace) {
  //     state = AsyncError(error, stackTrace);
  //   }
  // }

  @override
  FutureOr<CounterModel> build() async {
    Log.d(message: 'Counter Provider is created.');
    ref.onDispose(() {
      Log.d(message: 'Counter Provider is disposed.');
    });
    return Future.delayed(const Duration(seconds: 2)).then((_) => const CounterModel(0));
  }

  Future<CounterModel> _increaseBy1(final int i) async => Future.delayed(const Duration(seconds: 1)).then((_) {
    if (Random.secure().nextBool()) {
      throw 'Error: Unknown';
    }
    return CounterModel(i+1);
  });
}

class CounterModel {
  final int number;
  const CounterModel(this.number);
}
