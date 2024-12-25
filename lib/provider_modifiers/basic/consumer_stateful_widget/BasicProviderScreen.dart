
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../BasicProvider.dart';

class BasicProviderScreen extends ConsumerStatefulWidget {
  const BasicProviderScreen({super.key});

  @override
  ConsumerState<BasicProviderScreen> createState() => _BasicProviderScreenState();
}

class _BasicProviderScreenState extends ConsumerState<BasicProviderScreen> {

  @override
  Widget build(final BuildContext context) => AppScaffold(
      title: 'Provider (Consumer Stateful Widget)',
      body: Center(
          child: Text('${ref.read(greeting)} ${ref.watch(name)}', style: Theme.of(context).textTheme.headlineLarge)
      )
  );
}