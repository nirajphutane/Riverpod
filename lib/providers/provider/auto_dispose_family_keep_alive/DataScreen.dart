
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

  final provider = dataProvider((canDispose: true, key: null));

  @override
  Widget build(final BuildContext context) => AppScaffold(
    title: 'Auto Dispose Family Provider',
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
          AppButton(text: 'Screen-1 (Same Instance(canDispose: true, key: null))', onTab: () => Navigation.push(context, Screen1())),
          AppButton(text: 'Screen-2 (New Instance(canDispose: false, key: null))', onTab: () => Navigation.push(context, Screen2())),
          AppButton(text: 'Screen-3 (Instance(canDispose: true, key: key))', onTab: () => Navigation.push(context, Screen3()))
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

  final provider = dataProvider((canDispose: true, key: null));

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

  final provider = dataProvider((canDispose: false, key: null));

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

class Screen3 extends ConsumerWidget {
  Screen3({super.key});

  final provider = dataProvider((canDispose: true, key: 'Key-123'));

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
      title: 'Child Screen-3',
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
              AppButton(text: 'Screen-4 (Instance(canDispose: true, key: key))', onTab: () => Navigation.push(context, Screen4()))
            ]
          )
      )
  );
}

class Screen4 extends ConsumerWidget {
  Screen4({super.key});

  final provider = dataProvider((canDispose: true, key: 'Key-123'));

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
      title: 'Child Screen-4',
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
            ref.invalidate(dataProvider);
          }
      )
  );
}
