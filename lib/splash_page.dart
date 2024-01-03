import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kavyanepal/config/config.dart';
import 'package:kavyanepal/features/home/providers/quote_api_provider.dart';
import 'package:kavyanepal/features/home/screens/home_page.dart';

class SplashPage extends StatefulHookConsumerWidget {
  const SplashPage({super.key});
  static const String routeName = "/splashpage";
  static GoRoute route() {
    return GoRoute(
      path: routeName,
      builder: (context, state) => const SplashPage(),
    );
  }

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(AssetPath.logo),
      ),
    );
  }

  void initData() {
    Future(() async {
      await ref.read(quoteStateProvider.notifier).init();
    }).then(
      (value) => context.go(HomePage.routeName),
    );
  }
}
