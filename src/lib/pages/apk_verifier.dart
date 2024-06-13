import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import "package:installed_apps/installed_apps.dart";
import 'package:package_info_plus/package_info_plus.dart';

class APKVerifierRoute extends StatefulWidget {
  const APKVerifierRoute({super.key});

  @override
  State<APKVerifierRoute> createState() => _APKVerifierRouteState();
}

class _APKVerifierRouteState extends State<APKVerifierRoute> {
  @override
  void initState() {
    super.initState();
  }

  // Queries all packages installed in user's phone.
  // All of this is a bit scuffed rn.
  List<AppInfo> _installedApps = [];

  bool _hasBeenChecked = false;
  String _info = "";

  Future<void> _initPackageInfo() async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps();
    setState(() {
      _installedApps = apps;
    });
  }

  Future<void> _verifyApps() async {
    if (_installedApps.isEmpty) {
      setState(() {
        _info = "No apps installed, can't check.";
      });
    } else {}

    setState(() {
      _hasBeenChecked = true;
    });
  }

  Future<bool> _isAppSigned(String packageName) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    bool state = packageInfo.packageName == packageName;

    if (state)
      setState(() {
        _info += "Package " + packageName + " is not signed!";
      });

    return state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("APK Verifier")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "This will check your local installed programs and look for common debug/hash, unsigned keycert, and warn user about it."),
            if (!_hasBeenChecked)
              ElevatedButton(
                child: const Text("Check apps!"),
                onPressed: () {
                  _verifyApps();
                },
              )
            else
              ListView.builder(
                  itemCount: _installedApps.length,
                  itemBuilder: (context, index) {
                    AppInfo app = _installedApps[index];

                    return ListTile(
                      title: Text(app.name),
                      subtitle: Text(app.packageName),
                      trailing: FutureBuilder<bool>(
                          future: _isAppSigned(app.packageName),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else {
                              if (snapshot.hasError || snapshot.data == null) {
                                return const Text("Failed!");
                              } else {
                                return snapshot.data!
                                    ? const Icon(Icons.check)
                                    : const Icon(Icons.close);
                              }
                            }
                          }),
                    );
                  })
          ],
        )));
  }
}
