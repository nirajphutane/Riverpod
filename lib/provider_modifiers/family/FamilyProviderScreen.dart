
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:riverpod_provider/provider_modifiers/family/Greeting.dart';
import 'FamilyProvider.dart';

class FamilyProviderScreen extends ConsumerWidget {
  const FamilyProviderScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {

    final niraj = ref.watch(greeting(const Greet('Good morning', 'Niraj')));
    final gauri = ref.read(greeting(const Greet('Good evening', 'Gauri')));

    return AppScaffold(
      title: 'Family Provider',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(niraj, style: Theme.of(context).textTheme.headlineLarge),
            Text(gauri, style: Theme.of(context).textTheme.headlineLarge)
          ]
        )
      )
    );
  }
}