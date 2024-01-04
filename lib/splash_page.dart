// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kavyanepal/config/config.dart';
import 'package:kavyanepal/features/home/providers/quote_api_provider.dart';
import 'package:kavyanepal/features/home/screens/home_page.dart';
import 'package:kavyanepal/features/more/screens/screens.dart';
import 'package:kavyanepal/utils/custom_bot_toast.dart';

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

  void initData() async {
    if (await hasNetwork()) {
      Future(() async {
        await ref.read(quoteStateProvider.notifier).init();
      }).then(
        (value) => context.go(HomePage.routeName),
      );
    } else {
      CustomBotToast.text(
          'No internet!!!\nPlease connect with internet and restart the app.',
          duration: const Duration(seconds: 5),
          isSuccess: false);
      context.go(FavoritePage.routeName);
    }
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
