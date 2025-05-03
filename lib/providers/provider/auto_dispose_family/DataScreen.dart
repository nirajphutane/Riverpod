
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/Navigation/Navigation.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/common_widgets/Button.dart';
import 'AutoDisposeFamilyProvider.dart';

class DataScreen extends ConsumerStatefulWidget {
  const DataScreen({super.key});

  @override
  ConsumerState<DataScreen> createState() => _DataScreen();
}

class _DataScreen extends ConsumerState<DataScreen> {

  final provider = dataProvider('Screen-1');

  @override
  Widget build(final BuildContext context) => AppScaffold(
    title: 'Auto Dispose Family Provider (ConsumerStatefulWidget)',
    actions: [
      IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () => ref.refresh(provider)
      )
    ],
    body: Center(
      child: Column(
        children: [
          Consumer(
            builder: (context, ref, child) => Text(ref.watch(provider), style: Theme.of(context).textTheme.headlineLarge)
          ),
          AppButton(text: 'Screen-1 (Same Instance)', onTab: () => Navigation.push(context, Screen1())),
          AppButton(text: 'Screen-2 (New Instance)', onTab: () => Navigation.push(context, Screen2()))
        ]
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

class Screen1 extends ConsumerWidget {
  Screen1({super.key});

  final provider = dataProvider('Screen-1');

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
      title: 'Child Screen-1',
      actions: [
        IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(provider)
        )
      ],
      body: Center(
          child: Consumer(
              builder: (context, ref, child) => Text(ref.watch(provider), style: Theme.of(context).textTheme.headlineLarge)
          )
      ),
      fab: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
            ref.invalidate(provider);
          }
      )
  );
}

class Screen2 extends ConsumerWidget {
  Screen2({super.key});

  final provider = dataProvider('Screen-2');

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
      title: 'Child Screen-2',
      actions: [
        IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(provider)
        )
      ],
      body: Center(
          child: Consumer(
              builder: (context, ref, child) => Text(ref.watch(provider), style: Theme.of(context).textTheme.headlineLarge)
          )
      )
  );
}
