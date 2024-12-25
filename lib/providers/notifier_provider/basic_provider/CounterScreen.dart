
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../notifier_provider/basic_provider/CounterProvider.dart';

class CounterScreen extends ConsumerWidget {

  const CounterScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
      title: 'Notifier Provider',
      body: Center(
          child: Text('${ref.watch(counterProvider).number}', style: Theme.of(context).textTheme.headlineLarge)
      ),
      fab: FloatingActionButton(
          onPressed: () => ref.read(counterProvider.notifier).increaseBy1(),
          child: const Icon(Icons.plus_one_outlined)
      )
  );
}