
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/Navigation/Navigation.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/common_widgets/Button.dart';
import 'AutoDisposeProvider.dart';

class DataScreen extends ConsumerWidget {
  const DataScreen({super.key});
  
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
    title: 'Auto Dispose Provider (ConsumerWidget)',
    actions: [
      IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () => ref.refresh(dataProvider)
      )
    ],
    body: Center(
      child: Column(
        children: [
          Consumer(
            builder: (context, ref, child) => Text(ref.watch(dataProvider), style: Theme.of(context).textTheme.headlineLarge)
          ),
          AppButton(text: 'Screen (Same Instance)', onTab: () => Navigation.push(context, const ChildScreen()))
        ]
      )
    )
  );
}

class ChildScreen extends ConsumerWidget {
  const ChildScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
      title: 'Child Screen',
      actions: [
        IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(dataProvider)
        )
      ],
      body: Center(
          child: Consumer(
              builder: (context, ref, child) => Text(ref.watch(dataProvider), style: Theme.of(context).textTheme.headlineLarge)
          )
      ),
      fab: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
            ref.invalidate(dataProvider);
          }
      )
  );
}

