
import 'package:flutter/material.dart';
import 'package:riverpod_provider/core/common_widgets/AppScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../BasicProvider.dart';

class BasicProviderScreen extends StatelessWidget {
  const BasicProviderScreen({super.key});
  
  @override
  Widget build(final BuildContext context) => AppScaffold(
    title: 'Provider (State Widget)',
    body: Center(
      child: Consumer(
        builder: (context, ref, child) => Text('${ref.read(greeting)} ${ref.watch(name)}', style: Theme.of(context).textTheme.headlineLarge)
      )
    )
  );
}