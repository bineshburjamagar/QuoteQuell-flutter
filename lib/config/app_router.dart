import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kavyanepal/features/home/screens/screens.dart';
import 'package:kavyanepal/features/welcome/screens/screens.dart';

class AppRouter {
  static final router = GoRouter(
    observers: [
      BotToastNavigatorObserver(),
    ],
    initialLocation: WelcomePage.routeName,
    routes: [
      WelcomePage.route(),
      NameSetupPage.route(),
      GenderSetupPage.route(),
      HomePage.route(),
    ],
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Look who is here,"),
              Text("A HACKER,"),
            ],
          ),
        ),
      );
    },
  );
}
