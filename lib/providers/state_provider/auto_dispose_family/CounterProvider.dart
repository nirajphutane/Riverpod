
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/logs/Logs.dart';

final counterProvider = StateProvider.autoDispose.family<int, int>((ref, initialValue) {
  Log.d(message: 'Counter Provider is created.');
  ref.onDispose(() {
    Log.d(message: 'Counter Provider is disposed.');
  });
  return initialValue;
});
