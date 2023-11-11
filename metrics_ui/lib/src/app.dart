import 'package:flutter/material.dart';
import 'package:metrics_ui/src/Metrics/metricsUI.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Metrics/theme_provider.dart';

//Future<void> _loadSavedTheme(ThemeProvider themeProvider) async {
//  final prefs = await SharedPreferences.getInstance();
//  final isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
//  themeProvider.toggleTheme(isDarkTheme);
//}

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeProvider _themeProvider;
  @override
  void initState() {
    super.initState();
    _themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    Color scaffoldColor = themeProvider.scaffoldColor;
    Color textColor = themeProvider.textColor;
    Color buttonColor = themeProvider.buttonColor;

    // Color scaffoldColor = const Color.fromARGB(255, 42, 38, 36);
    // Color textColor = const Color.fromARGB(255, 255, 247, 244);
    // Color buttonColor = const Color.fromARGB(255, 255, 144, 39);
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor:
                scaffoldColor, //const Color.fromARGB(255, 255, 255, 255),
            textTheme: TextTheme(
              displayLarge: TextStyle(
                color: textColor,
                fontSize: 22,
                fontFamily: 'PT-Serif',
                fontWeight: FontWeight.bold,
              ),
              displayMedium: TextStyle(
                color: textColor,
                fontSize: 15,
                fontFamily: 'PT-Serif',
                fontWeight: FontWeight.bold,
              ),
            )),
        home: const MetricsPage());
  }
}
