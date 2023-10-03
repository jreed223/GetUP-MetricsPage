import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:metrics_ui/src/Metrics/metrics.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color scaffoldColor = const Color.fromARGB(255, 42, 38, 36);
    Color textColor = const Color.fromARGB(255, 255, 247, 244);
    Color buttonColor = const Color.fromARGB(255, 255, 144, 39);
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                color: Color.fromARGB(255, 189, 216, 255),
                fontSize: 22,
                fontFamily: 'PT-Serif',
                fontWeight: FontWeight.bold,
              ),
              displayMedium: TextStyle(
                color: Color.fromARGB(255, 189, 216, 255),
                fontSize: 15,
                fontFamily: 'PT-Serif',
                fontWeight: FontWeight.bold,
              ),
            )),
        home: const MetricsPage());
  }
}
