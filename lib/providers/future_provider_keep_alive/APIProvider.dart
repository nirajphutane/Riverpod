
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/logs/Logs.dart';

final apiProvider = FutureProvider.autoDispose((ref) async {
  Log.d(message: 'API Provider is created.');
  ref.onDispose(() {
    Log.d(message: 'API Provider is disposed.');
  });
  final List<Item> items = await const API(100).fetch();
  ref.keepAlive();
  return items;
});

class API {
  final int records;
  const API(this.records);
  Future<List<Item>> fetch() async => Future.delayed(const Duration(seconds: 3)).then((_) {
    if (Random.secure().nextBool()) {
      throw 'Error: 440';
    }
    return List.generate(records, (index) => Item(index, 'Item-${index+1}'));
  });
}

class Item {
  final int index;
  final String name;

  Item(this.index, this.name);
}