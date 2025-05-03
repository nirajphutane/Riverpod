
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/Navigation/Navigation.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/common_widgets/Button.dart';
import 'package:riverpod_provider/core/random/DataGenerator.dart';
import 'BasicProvider.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});
  
  @override
  Widget build(final BuildContext context) => AppScaffold(
    title: 'Basic Provider (StatelessWidget)',
    actions: [
      Consumer(
          builder: (context, ref, child) => IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(dataProvider)
          )
      )
    ],
    body: Center(
      child: Column(
        children: [
          Consumer(
            builder: (context, ref, child) => Text(ref.watch(dataProvider), style: Theme.of(context).textTheme.headlineLarge)
          ),
          AppButton(text: 'Screen-1 (Same Instance)', onTab: () => Navigation.push(context, const Screen1())),
          AppButton(text: 'Screen-2 (Child: Override)', onTab: () => Navigation.push(context, const Screen2())),
          AppButton(text: 'Screen-3 (Override(Child))', onTab: () => Navigation.push(context, ProviderScope(overrides: [dataProvider.overrideWith((ref) => RandomGen.strNum(7))], child: const Screen3())))
        ]
      )
    ),
    fab: Consumer(
        builder: (context, ref, child) => FloatingActionButton(
            child: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
              ref.invalidate(dataProvider);
            }
        )
    )
  );
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(final BuildContext context) => AppScaffold(
      title: 'Screen-1',
      body: Center(
          child: Consumer(
              builder: (context, ref, child) => Text(ref.read(dataProvider), style: Theme.of(context).textTheme.headlineLarge)
          )
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

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(final BuildContext context) => AppScaffold(
      title: 'Screen-3',
      body: Center(
          child: Consumer(
              builder: (context, ref, child) => Text(ref.read(dataProvider), style: Theme.of(context).textTheme.headlineLarge)
          )
      )
  );
}
