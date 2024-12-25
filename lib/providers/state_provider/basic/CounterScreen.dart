
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/providers/state_provider/basic/CounterProvider.dart';
import '../../../core/toast/Toast.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {

    ref.listen<int>(counterProvider, (previous, next) {
      if (next % 10 == 0) {
        Toast.show('You reached at $next, Congratulations!!!');
      }
    });

    return AppScaffold(
      title: 'State Provider',
      body: Center(
        child: Text('${ref.watch(counterProvider)}', style: Theme.of(context).textTheme.headlineLarge)
      ),
      fab: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).update((state) => state + 1),
        child: const Icon(Icons.plus_one_outlined)
      )
    );
  }
}