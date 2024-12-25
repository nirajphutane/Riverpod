
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/logs/Logs.dart';
import '../../../core/common_widgets/AppScaffold.dart';
import 'ClockProvider.dart';

class ClockScreen extends ConsumerWidget {
  ClockScreen({super.key});

  final _clockProvider = clockProvider(11);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {

    Log.d(message: _clockProvider.notifier);

    return AppScaffold(
      title: 'Auto Dispose Family Stream Provider',
      actions: [
        IconButton(
            onPressed: () => ref.invalidate(clockProvider),
            icon: const Icon(Icons.replay)
        ),
        IconButton(
            onPressed: () => ref.refresh(_clockProvider),
            icon: const Icon(Icons.refresh)
        )
      ],
      body: Center(
        child: ref.watch(_clockProvider).when(
          skipLoadingOnRefresh: false,
          data: (final UIState state) {
            switch(state) {
              case Running() || Paused(): {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(state.now!.now, style: Theme.of(context).textTheme.headlineLarge),
                      Text(state.now!.ticks, style: Theme.of(context).textTheme.headlineSmall),

                      const Divider(thickness: 1, indent: 16, endIndent: 16),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () => state is Paused? ref.watch(_clockProvider.notifier).resume(): ref.watch(_clockProvider.notifier).pause(),
                                icon: Icon(state is Paused? Icons.play_arrow: Icons.pause)
                            ),
                            IconButton(
                                onPressed: () => ref.watch(_clockProvider.notifier).reset(),
                                icon: const Icon(Icons.lock_reset)
                            )
                          ]
                      )
                    ]
                );
              }
            }
          },
          error: (error, stackTrace) => Text(error.toString(), style: const TextStyle(color: Colors.red)),
          loading: ()=> const CircularProgressIndicator()
        )
      )
    );
  }
}
