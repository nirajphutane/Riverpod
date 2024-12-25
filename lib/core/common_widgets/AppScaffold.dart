
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {

  final String title;
  final Widget? body;
  final FloatingActionButton? fab;
  final List<Widget>? actions;

  const AppScaffold({super.key, required this.title, this.body, this.fab, this.actions});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title),
      actions: actions,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: body,
    floatingActionButton: fab
  );
}