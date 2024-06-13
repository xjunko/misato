import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Prototype routes, design will come in later!")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Routes to be tested and implemented."),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/safetynet");
                      },
                      child: const Text("SafetyNet")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/applications");
                      },
                      child: const Text("Applications"))
                ],
              )
            ],
          ),
        ));
  }
}
