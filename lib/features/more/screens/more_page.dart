import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kavyanepal/components/components.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);
  static const String routeName = "/morepage";
  static GoRoute route() {
    return GoRoute(
      path: routeName,
      builder: (context, state) => const MorePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            titleText: 'More',
            actionWidget: SizedBox(),
          )
        ],
      ),
    );
  }
}
