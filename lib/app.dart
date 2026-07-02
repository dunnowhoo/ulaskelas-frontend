// Created by Muhamad Fauzi Ridwan on 23/08/21.

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:ulaskelas/app_wrapper.dart';
import 'package:ulaskelas/core/bases/states/_states.dart';
import 'package:ulaskelas/core/constants/_constants.dart';
import 'package:ulaskelas/services/_services.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      MixpanelService.track(AppSessionStartedEvent(launchType: 'warm'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder<ThemeState>(
      observeMany: const [
        GlobalState.theme,
        GlobalState.navigation,
      ],
      initState: (_, __) => __?.setState((s) => s.init()),
      builder: (context, snapshot) {
        return MaterialApp(
          title: Constants.ulaskelas,
          navigatorKey: nav.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: GlobalState.theme().state.type,
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
          home: const AppWrapper(),
          routes: {
            '/callback': (context) => Scaffold(
                  body: Container(),
                ),
          },
        );
      },
    );
  }
}
