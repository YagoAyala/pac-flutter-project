import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:random_pick/core/navigation/random_pick_navigation.dart';
import 'package:random_pick/features/random/random_number/presentation/pages/random_number_page.dart';

/// the main dashboard which contains two tabs
class RandomPage extends StatelessWidget {
  /// creates a random page screen
  const RandomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RandomPageView();
  }
}

/// the main dashboard widget/page which is the main page of [RandomPage]
class RandomPageView extends StatelessWidget {
  /// builds the main page view with tabs for random page
  const RandomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorteio de Restaurante'),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.history),
          ),
          IconButton(
            onPressed: () async {
              await PackageInfo.fromPlatform().then(
                (packageInfo) => Navigator.of(context).push(
                  MaterialPageRoute<Widget>(
                    builder: (context) => LicensePage(
                      applicationIcon:
                          Image.asset('assets/app_icon_foreground.png'),
                      applicationName: packageInfo.appName,
                      applicationVersion: packageInfo.version,
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(CupertinoIcons.info),
          ),
        ],
      ),
      body: IndexedStack(
        index: 0,
        children: [
          // first tab to display the random number pick
          Navigator(
            // add navigation key for nested navigation
            onGenerateRoute: (_) => MaterialPageRoute<Widget>(
              builder: (_) => RandomNumberPage(),
            ),
          ),
          // second tab to display the random list pick
        ],
      ),
    );
  }
}
