
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common_widgets/AppScaffold.dart';
import 'ClockProvider.dart';

class ClockScreen extends ConsumerWidget {
  const ClockScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
      title: 'Stream Provider',
      body: Center(
          child: ref.watch(clockProvider).when(
              data: (final Now now) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(now.now, style: Theme.of(context).textTheme.headlineLarge),
                  Text(now.ticks, style: Theme.of(context).textTheme.headlineSmall),
                ]
              ),
              error: (error, stackTrace) => Text(error.toString(), style: const TextStyle(color: Colors.red)),
              loading: ()=> const CircularProgressIndicator()
          )
      )
  );
}
