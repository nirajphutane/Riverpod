
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/logs/Logs.dart';
import 'Greeting.dart';

final greeting = Provider.family<String, Greet>((ref, greet) {
  Log.d(message: 'Greeting Provider is created.');
  ref.onDispose(() {
    Log.d(message: 'Greeting Provider is disposed.');
  });
  return '${greet.greeting} ${greet.name}';
});
