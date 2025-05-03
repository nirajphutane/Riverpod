
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/logs/Logs.dart';
import 'package:riverpod_provider/core/random/DataGenerator.dart';

final dataProvider = Provider.autoDispose<String>((ref) {
  Log.d(message: 'Provider is created');
  ref.onDispose(() {
    Log.d(message: 'Provider is disposed');
  });
  return RandomGen.string(10);
});
