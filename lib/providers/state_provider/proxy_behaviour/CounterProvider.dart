
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/logs/Logs.dart';

final counterProvider = StateProvider<int>((ref) {
  Log.d(message: 'Counter Provider is created.');
  ref.onDispose(() {
    Log.d(message: 'Counter Provider is disposed.');
  });
  return 0;
});

final counterMessageProvider = StateProvider<String>((ref) {
  Log.d(message: 'Counter Message Provider is created.');
  ref.onDispose(() {
    Log.d(message: 'Counter Message Provider is disposed.');
  });
  switch(ref.watch(counterProvider)) {
    case 1: {
      return 'You clicked ${ref.watch(counterProvider)} st time.';
    }

    case 2: {
      return 'You clicked ${ref.watch(counterProvider)} nd time.';
    }

    case 3: {
      return 'You clicked ${ref.watch(counterProvider)} rd time.';
    }

    default: {
      return 'You clicked ${ref.watch(counterProvider)} th time.';
    }
  }
});

/*
  Note:
    1. The dependent Provider is dispose automatic without defining autoDispose.
    2. If Parent Provider is autoDispose then dependent Provider is must autoDispose.
*/