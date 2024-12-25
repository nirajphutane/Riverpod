
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'AutoDisposeProvider.dart';

class AutoDisposeProviderScreen extends ConsumerWidget {
  const AutoDisposeProviderScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
      title: 'Auto Dispose Provider',
      body: Center(
          child: Text('${ref.read(greeting)} ${ref.watch(name)}', style: Theme.of(context).textTheme.headlineLarge)
      )
  );
}