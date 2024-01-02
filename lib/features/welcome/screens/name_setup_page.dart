import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kavyanepal/components/components.dart';

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
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 23.0, vertical: 10.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'What is your name?',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  CustomTextField(
                    labelText: '',
                    isFilled: true,
                    hintText: 'Your name',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
