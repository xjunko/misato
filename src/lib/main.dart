import 'package:flutter/material.dart';
import "package:misato/pages/about.dart";

import "package:misato/pages/home_page.dart";
import "package:misato/pages/unused/safetynet.dart";
import "package:misato/pages/unused/apk_verifier.dart";

void main() {
  runApp(const MisatoApp());
}

class MisatoApp extends StatelessWidget {
  const MisatoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Misato',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 76, 77, 158)),
          useMaterial3: true,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const HomeRoute(),
          "/about": (context) => const AboutRoute(),
          "/safetynet": (context) => const SafetyNetRoute(),
          "/applications": (context) => const APKVerifierRoute(),
        });
  }
}
