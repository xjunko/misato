import 'package:flutter/material.dart';

class SafetyNetRoute extends StatelessWidget {
  const SafetyNetRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("SafetyNet")),
        body: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("More SafetyNet info will be here!"),
          ],
        )));
  }
}
