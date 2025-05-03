
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/Navigation/Navigation.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/common_widgets/Button.dart';
import 'FamilyProvider.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreen();
}

class _DataScreen extends State<DataScreen> {

  final provider = dataProvider(null);

  @override
  Widget build(final BuildContext context) => AppScaffold(
    title: 'Family Provider (StatelessWidget)',
    actions: [
      Consumer(
          builder: (context, ref, child) => IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(provider)
          )
      )
    ],
    body: Center(
      child: Column(
        children: [
          Consumer(
            builder: (context, ref, child) => Text(ref.watch(provider), style: Theme.of(context).textTheme.headlineLarge)
          ),
          AppButton(text: 'Screen-1 (Same Instance)', onTab: () => Navigation.push(context, const Screen1())),
          AppButton(text: 'Screen-2 (New Instance)', onTab: () => Navigation.push(context, Screen2()))
        ]
      )
    ),
    fab: Consumer(
        builder: (context, ref, child) => FloatingActionButton(
            child: const Icon(Icons.close),
            onPressed: () {
              ref.invalidate(dataProvider);
              Navigator.pop(context);
            }
        )
    )
  );
}

class Screen1 extends ConsumerWidget {
  const Screen1({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
      title: 'Child Screen-1',
      actions: [
        IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(dataProvider(null))
        )
      ],
      body: Center(
          child: Consumer(
              builder: (context, ref, child) => Text(ref.watch(dataProvider(null)), style: Theme.of(context).textTheme.headlineLarge)
          )
      ),
      fab: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
            ref.invalidate(dataProvider(null));
          }
      )
  );
}

class Screen2 extends ConsumerWidget {
  Screen2({super.key});

  final provider = dataProvider(0);

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
