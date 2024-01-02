import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kavyanepal/components/components.dart';
import 'package:kavyanepal/config/asset_path.dart';

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
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 23.0, vertical: 10.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetPath.nameSetup,
                    alignment: Alignment.center,
                  ),
                  const Center(
                    child: Text(
                      'What is your name?',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const CustomTextField(
                    labelText: '',
                    isFilled: true,
                    hintText: 'Your name',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.0, vertical: 20.0),
        child: CustomButton(),
      ),
    );
  }
}
