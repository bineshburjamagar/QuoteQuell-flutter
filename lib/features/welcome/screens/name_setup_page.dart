import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NameSetupPage extends StatelessWidget {
  const NameSetupPage({Key? key}) : super(key: key);
  static const String routeName = "/namesetuppage";
  static GoRoute route() {
    return GoRoute(
      path: routeName,
      builder: (context, state) => const NameSetupPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [Text('data')],
      ),
    );
  }
}
