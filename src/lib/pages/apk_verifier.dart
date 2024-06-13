import 'package:flutter/material.dart';

class APKVerifierRoute extends StatelessWidget {
  const APKVerifierRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("APK Verifier")),
        body: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "This will check your local installed programs and look for common debug/hash, unsigned keycert, and warn user about it."),
          ],
        )));
  }
}
