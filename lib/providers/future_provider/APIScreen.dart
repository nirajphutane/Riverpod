
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_provider/providers/future_provider/APIProvider.dart';
import '../../core/common_widgets/AppScaffold.dart';

class APIScreen extends ConsumerWidget {
  const APIScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => AppScaffold(
        title: 'Future Provider',
        body: Center(
          child: ref.watch(apiProvider).when(
              data: (final List<Item> items) => ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('$index'),
                  ),
                  trailing: const Icon(Icons.monetization_on_outlined),
                  title: Text(items[index].name)
                )
              ),
              error: (error, stackTrace) => Text(error.toString(), style: const TextStyle(color: Colors.red)),
              loading: ()=> const CircularProgressIndicator()
          )
        )
    );
}