
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_provider/core/logs/Logs.dart';

final clockProvider = StreamProvider.autoDispose<Now>((ref) {
  Log.d(message: 'Clock Provider is created.');
  ref.onDispose(() {
    Log.d(message: 'Clock Provider is disposed.');
  });
  return Clock().current();
});

class Clock {
  int _ticks = 0;
  Stream<Now> current() => Stream.periodic(const Duration(seconds: 1), (time) {
    _ticks++;
    if (Random.secure().nextBool()) {
      throw 'Error: Unknown';
    }
    return Now(DateFormat('dd/MMM/yyyy - HH:mm:ss').format(DateTime.now()), '${_zeroPaddedTwoDigits((_ticks / 60) % 60)} : ${_zeroPaddedTwoDigits((_ticks % 60))}');
  });
  String _zeroPaddedTwoDigits(final double ticks) => '${ticks.floor()}'.padLeft(2, '0');
}

class Now {
  final String now;
  final String ticks;
  const Now(this.now, this.ticks);
}
