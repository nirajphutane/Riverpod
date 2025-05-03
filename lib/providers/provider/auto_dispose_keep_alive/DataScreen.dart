
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/Navigation/Navigation.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/common_widgets/Button.dart';
import 'package:riverpod_provider/core/random/DataGenerator.dart';
import 'AutoDisposeProvider.dart';

class DataScreen extends ConsumerStatefulWidget {
  const DataScreen({super.key});

  @override
  ConsumerState<DataScreen> createState() => _DataScreen();
}

class _DataScreen extends ConsumerState<DataScreen> {
  
  @override
  Widget build(final BuildContext context) => AppScaffold(
    title: 'Keep Alive Auto Dispose Provider',
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
          AppButton(text: 'Screen-1 (Same Instance)', onTab: () => Navigation.push(context, const Screen1())),
          AppButton(text: 'Screen-2 (New Instance)', onTab: () => Navigation.push(context, const Screen2()))
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
  const Screen1({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
      title: 'Screen-1',
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

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(final BuildContext context) => ProviderScope(
      overrides: [
        dataProvider.overrideWith((ref) => RandomGen.number(7))
      ],
      child: AppScaffold(
          title: 'Screen-2',
          body: Center(
              child: Consumer(
                  builder: (context, ref, child) => Text(ref.read(dataProvider), style: Theme.of(context).textTheme.headlineLarge)
              )
          )
      )
  );
}