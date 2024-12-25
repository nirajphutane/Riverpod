
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logs/Logs.dart';
import '../../async_notifier_provider/auto_dispose_family_provider/CounterProvider.dart';

class CounterScreen extends ConsumerWidget {
  CounterScreen({super.key});

  final _counterProvider = counterProvider(11);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {

    Log.d(message: _counterProvider);

    return AppScaffold(
      title: 'Auto Dispose Family Async Notifier Provider',
      actions: [
        IconButton(
            onPressed: () => ref.invalidate(_counterProvider),
            icon: const Icon(Icons.replay)
        ),
        IconButton(
            onPressed: () => ref.refresh(_counterProvider),
            icon: const Icon(Icons.refresh)
        )
      ],
      body: Center(
        child: ref.watch(_counterProvider).when(
            skipLoadingOnRefresh: false,
            data: (final CounterModel model) => Text('${model.number}', style: Theme.of(context).textTheme.headlineLarge),
            error: (error, stackTrace) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(error.toString(), style: const TextStyle(color: Colors.red)),
                IconButton(
                    onPressed: () => ref.invalidate(_counterProvider),
                    icon: const Icon(Icons.replay)
                )
              ]
            ),
            loading: ()=> const CircularProgressIndicator()
        )
      ),
      fab: FloatingActionButton(
          onPressed: () => ref.read(_counterProvider.notifier).increaseBy1(),
          child: const Icon(Icons.plus_one_outlined)
      )
    );
  }
}