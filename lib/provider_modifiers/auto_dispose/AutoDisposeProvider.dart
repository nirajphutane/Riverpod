
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/logs/Logs.dart';

final greeting = Provider.autoDispose<String>((ref) {
  Log.d(message: 'Greeting Provider is created.');
  ref.onDispose(() {
    Log.d(message: 'Greeting Provider is disposed.');
  });
  return 'Hello';
});

final name = Provider.autoDispose<String>((ref) {
  Log.d(message: 'Name Provider is created.');
  ref.onDispose(() {
    Log.d(message: 'Name Provider is disposed.');
  });
  return 'Niraj';
});