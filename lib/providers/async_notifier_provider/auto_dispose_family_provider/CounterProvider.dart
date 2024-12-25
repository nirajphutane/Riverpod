
import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logs/Logs.dart';

final counterProvider = AsyncNotifierProvider.autoDispose.family<Counter, CounterModel, int>(Counter.new);

class Counter extends AutoDisposeFamilyAsyncNotifier<CounterModel, int> {

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
  FutureOr<CounterModel> build(final int arg) async {
    Log.d(message: 'Counter Provider is created.');
    ref.onDispose(() {
      Log.d(message: 'Counter Provider is disposed.');
    });
    return Future.delayed(const Duration(seconds: 2)).then((_) => CounterModel(arg));
  }

  Future<CounterModel> _initialValue(final int i) async => Future.delayed(const Duration(seconds: 1)).then((_) {
    if (Random.secure().nextBool()) {
      throw 'Error: Unknown';
    }
    return CounterModel(i+1);
  });

  Future<CounterModel> _increaseBy1(final int i) async => Future.delayed(const Duration(seconds: 3)).then((_) {
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
