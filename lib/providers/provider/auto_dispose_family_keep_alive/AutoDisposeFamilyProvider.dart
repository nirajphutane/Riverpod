
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/logs/Logs.dart';
import 'package:riverpod_provider/core/random/DataGenerator.dart';

final dataProvider = Provider.autoDispose.family<String, ({dynamic key, bool? canDispose})>((ref, param) {
  Log.d(message: 'Provider is created');

  final link = ref.keepAlive();

  ref.onCancel(() {
    if (param.canDispose == true) {
      link.close();
    }
  });

  ref.onDispose(() {
    Log.d(message: 'Provider is disposed');
  });
  return '${param.key} ${param.canDispose == true?'Auto': 'Non'} disposable: ${RandomGen.string(10)}';
});