
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/providers/state_provider/auto_dispose_family/CounterProvider.dart';
import '../../../core/toast/Toast.dart';

class CounterScreen extends ConsumerWidget {
  CounterScreen({super.key});

  final counter = counterProvider(11);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {

    ref.listen<int>(counter, (previous, next) {
      if (next % 10 == 0) {
        Toast.show('You reached at $next, Congratulations!!!');
      }
    });

    return AppScaffold(
        title: 'Family State Provider',
        body: Center(
            child: Text('${ref.watch(counter)}', style: Theme.of(context).textTheme.headlineLarge)
        ),
        fab: FloatingActionButton(
            onPressed: () => ref.read(counter.notifier).update((state) => state + 1),
            child: const Icon(Icons.plus_one_outlined)
        )
    );
  }
}