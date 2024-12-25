
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logs/Logs.dart';
import '../../async_notifier_provider/auto_dispose_provider/CounterProvider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {

    Log.d(message: counterProvider);

    return AppScaffold(
      title: 'Auto Dispose Async Notifier Provider',
      actions: [
        IconButton(
            onPressed: () => ref.invalidate(counterProvider),
            icon: const Icon(Icons.replay)
        ),
        IconButton(
            onPressed: () => ref.refresh(counterProvider),
            icon: const Icon(Icons.refresh)
        )
      ],
      body: Center(
          child: ref.watch(counterProvider).when(
              skipLoadingOnRefresh: false,
              data: (final CounterModel model) => Text('${model.number}', style: Theme.of(context).textTheme.headlineLarge),
              error: (error, stackTrace) => Text(error.toString(), style: const TextStyle(color: Colors.red)),
              loading: ()=> const CircularProgressIndicator()
          )
      ),
      fab: FloatingActionButton(
          onPressed: () => ref.read(counterProvider.notifier).increaseBy1(),
          child: const Icon(Icons.plus_one_outlined)
      )
    );
  }
}