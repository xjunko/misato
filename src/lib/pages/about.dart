import 'package:flutter/material.dart';

class AboutRoute extends StatefulWidget {
  const AboutRoute({super.key});

  @override
  State<AboutRoute> createState() => _AboutRouteState();
}

class _AboutRouteState extends State<AboutRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("ASUkA",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              const Text("Android Security Universal Checker [Rev A]"),
              const SizedBox(height: 10),
              Card.outlined(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: const Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListTile(
                        title: Text("About",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Device Info
                            Text(
                              "Why",
                              style: TextStyle(fontSize: 14),
                            ),
                            Text("I ask that myself everyday."),
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        )));
  }
}
