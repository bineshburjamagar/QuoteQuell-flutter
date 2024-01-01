import 'package:flutter/material.dart';
import 'package:kavyanepal/config/config.dart';
import 'package:kavyanepal/features/welcome/screens/screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}
