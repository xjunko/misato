import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  bool _hasChecked = false;

  Future<String> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo android = await deviceInfo.androidInfo;
      return "${android.model} (${android.id})";
    }

    if (Platform.isWindows) {
      WindowsDeviceInfo windows = await deviceInfo.windowsInfo;
      return "${windows.deviceId.replaceAll('{', '').replaceAll('}', '')} (${windows.releaseId})";
    }

    return "unknown (unknown)";
  }

  Future<String> _getVersion() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo android = await deviceInfo.androidInfo;
      return "${android.version} (ABI ${android.supportedAbis.first})";
    }

    if (Platform.isWindows) {
      WindowsDeviceInfo windows = await deviceInfo.windowsInfo;
      return "${windows.displayVersion} (${windows.editionId} Edition)";
    }

    return "unknown (unknown)";
  }

  Future<String> _getPatchVersion() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo android = await deviceInfo.androidInfo;
      return "${android.version.securityPatch}";
    }

    if (Platform.isWindows) {
      WindowsDeviceInfo windows = await deviceInfo.windowsInfo;
      return windows.displayVersion;
    }

    return "unknown patch";
  }

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
              Text("ASUkA",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              Text("Android Security Universal Checker [Rev A]"),
              SizedBox(height: 10),
              _createDeviceInfoCard(context),
              if (_hasChecked) _createDeviceSecurityInfo(context),
              SizedBox(height: 3),
              SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                      icon: Icon(Icons.replay_outlined, size: 16),
                      label: Text("Run security checks"),
                      onPressed: () {
                        setState(() {
                          _hasChecked = true;
                        });
                      },
                      style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline)))))),
              SizedBox(height: 5),
              SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                      icon: Icon(Icons.my_library_books_rounded, size: 16),
                      label: Text("Learn more"),
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline)))))),
              SizedBox(height: 5),
              SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                      icon: Icon(Icons.my_library_books_rounded, size: 16),
                      label: Text("About"),
                      onPressed: () {
                        Navigator.pushNamed(context, "/about");
                      },
                      style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline)))))),
            ],
          ),
        )));
  }

  Card _createDeviceInfoCard(BuildContext context) {
    return Card.outlined(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              title:
                  Text("Device", style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Device Info
                  Text("Model", style: TextStyle(fontSize: 14)),
                  FutureBuilder(
                      future: _getDeviceInfo(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        if (snapshot.hasError) {
                          return Text("Failed to fetch info! [1]",
                              style: TextStyle(color: Colors.red));
                        }

                        if (snapshot.hasData) {
                          String deviceInfo = snapshot.data as String;
                          return Text(deviceInfo,
                              style: TextStyle(fontWeight: FontWeight.bold));
                        }

                        return Text("Failed to fetch info! [2]");
                      }),

                  // Version Info
                  Text("System version", style: TextStyle(fontSize: 14)),
                  FutureBuilder(
                      future: _getVersion(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        if (snapshot.hasError) {
                          return Text("Failed to fetch info! [1]",
                              style: TextStyle(color: Colors.red));
                        }

                        if (snapshot.hasData) {
                          String deviceInfo = snapshot.data as String;
                          return Text(deviceInfo,
                              style: TextStyle(fontWeight: FontWeight.bold));
                        }

                        return Text("Failed to fetch info! [2]");
                      }),
                  // Security Info
                  Text("Current patch version", style: TextStyle(fontSize: 14)),
                  FutureBuilder(
                      future: _getPatchVersion(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        if (snapshot.hasError) {
                          return Text("Failed to fetch info! [1]",
                              style: TextStyle(color: Colors.red));
                        }

                        if (snapshot.hasData) {
                          String deviceInfo = snapshot.data as String;
                          return Text(deviceInfo,
                              style: TextStyle(fontWeight: FontWeight.bold));
                        }

                        return Text("Failed to fetch info! [2]");
                      })
                ],
              ),
            )
          ],
        ));
  }

  Card _createDeviceSecurityInfo(BuildContext context) {
    return Card.outlined(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            ListTile(
                leading: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
                title: Text("Please wait...",
                    style: TextStyle(fontWeight: FontWeight.bold)))
          ],
        ));
  }
}
