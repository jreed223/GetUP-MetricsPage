import 'package:flutter/material.dart';
import 'package:metrics_ui/src/Metrics/theme_provider.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';

void main() async {
  final themeProvider = ThemeProvider();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
