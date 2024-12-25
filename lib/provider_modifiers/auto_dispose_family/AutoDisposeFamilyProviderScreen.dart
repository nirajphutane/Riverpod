
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'AutoDisposeFamilyProvider.dart';
import 'Greeting.dart';

class AutoDisposeFamilyProviderScreen extends ConsumerWidget {
  const AutoDisposeFamilyProviderScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {

    final niraj = ref.watch(greeting(const Greet('Good morning', 'Niraj')));
    final gauri = ref.read(greeting(const Greet('Good evening', 'Gauri')));
    final niraj1 = ref.watch(greeting(const Greet('Good morning', 'Niraj')));

    return AppScaffold(
        title: 'Family Auto Dispose Provider',
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(niraj, style: Theme.of(context).textTheme.headlineLarge),
                  Text(gauri, style: Theme.of(context).textTheme.headlineLarge),
                  Text(niraj1, style: Theme.of(context).textTheme.headlineLarge)
                ]
            )
        )
    );
  }
}