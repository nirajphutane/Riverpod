
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../BasicProvider.dart';

class BasicProviderScreen extends ConsumerWidget {
  const BasicProviderScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
    title: 'Provider (Consumer Widget)',
    body: Center(
      child: Text('${ref.read(greeting)} ${ref.watch(name)}', style: Theme.of(context).textTheme.headlineLarge)
    )
  );
}