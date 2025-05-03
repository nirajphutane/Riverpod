
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/logs/Logs.dart';
import 'package:riverpod_provider/core/random/DataGenerator.dart';

final dataProvider = Provider.autoDispose.family<String, dynamic>((ref, any) {
  Log.d(message: 'Provider is created');
  ref.onDispose(() {
    Log.d(message: 'Provider is disposed');
  });
  return any+': '+RandomGen.string(10);
});
