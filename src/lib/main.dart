import 'package:flutter/material.dart';

import "package:misato/pages/home_page.dart";
import "package:misato/pages/safetynet.dart";
import "package:misato/pages/apk_verifier.dart";

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
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x004c4e9e)),
          useMaterial3: true,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const HomeRoute(),
          "/safetynet": (context) => const SafetyNetRoute(),
          "/applications": (context) => const APKVerifierRoute(),
        });
  }
}
