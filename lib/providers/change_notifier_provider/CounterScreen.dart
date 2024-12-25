
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/providers/change_notifier_provider/CounterProvider.dart';

class CounterScreen extends ConsumerWidget {
  CounterScreen({super.key});

  final _counterProvider = counterProvider(10);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
      title: 'Auto Dispose State Provider',
      body: Center(
          child: Text('${ref.watch(_counterProvider).count.number}', style: Theme.of(context).textTheme.headlineLarge)
      ),
      fab: FloatingActionButton(
          onPressed: () => ref.read(_counterProvider.notifier).increaseBy1(),
          child: const Icon(Icons.plus_one_outlined)
      )
  );
}