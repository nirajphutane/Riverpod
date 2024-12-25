
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/logs/Logs.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'dart:math';

final clockProvider = StreamNotifierProvider<ClockProvider, UIState>(ClockProvider.new);

class ClockProvider extends StreamNotifier<UIState> {

  final Clock _clock = Clock();
  StreamSubscription<UIState>? _streamSubscription;

  @override
  Stream<UIState> build() {
    Log.d(message: 'Clock Provider is created.');
    ref.onDispose(() {
      Log.d(message: 'Clock Provider is disposed.');
      pause();
    });
    return Stream.value(Initial());
  }

  void start() {
    _streamSubscription?.cancel();
    _streamSubscription = _clock.current().listen((value) {
      state = AsyncData(value);
    }, onError: (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    });
  }

  void pause() {
    state = AsyncData(Paused(_clock.now));
    _streamSubscription?.pause();
  }

  void resume() => _streamSubscription?.resume();

  void reset() {
    _streamSubscription?.cancel();
    _clock.reset();
    start();
  }
}

class Clock {
  int _ticks = 0;
  Stream<UIState> current() => Stream.periodic(const Duration(seconds: 1), (time) {
    if (Random.secure().nextBool()) {
      throw 'Error: Unknown';
    }
    _ticks++;
    return Running(now);
  });

  void reset() => _ticks = 0;

  Now get now => Now(DateFormat('dd/MMM/yyyy - HH:mm:ss').format(DateTime.now()), '${_zeroPaddedTwoDigits((_ticks / 60) % 60)} : ${_zeroPaddedTwoDigits((_ticks % 60))}');
  String _zeroPaddedTwoDigits(final double ticks) => '${ticks.floor()}'.padLeft(2, '0');
}

class Now {
  final String now;
  final String ticks;
  const Now(this.now, this.ticks);
}

sealed class UIState {
  final Now? now;
  const UIState(this.now);
}

class Initial extends UIState {
  Initial() : super(null);
}

class Running extends UIState {
  const Running(super.now);
}

class Paused extends UIState {
  const Paused(super.now);
}
