import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kavyanepal/features/welcome/screens/screens.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  static const String routeName = "/welcomepage";
  static GoRoute route() {
    return GoRoute(
      path: routeName,
      builder: (context, state) => const WelcomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 23.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Lottie.asset('assets/animations/welcomeLight.json'),
            const Text(
              '🌟 Welcome to our Quotes App!\n 📚✨ Explore a world of wisdom and inspiration right at your fingertips. Let the journey begin! 🚀',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              height: 50.0,
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                onPressed: () {
                  context.push(NameSetupPage.routeName);
                },
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
