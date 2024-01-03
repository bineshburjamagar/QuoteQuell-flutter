import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kavyanepal/config/asset_path.dart';
import 'package:kavyanepal/features/home/widgets/widgets.dart';

import '../models/home_page_model.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  static const String routeName = "/homepage";
  static GoRoute route() {
    return GoRoute(
      path: routeName,
      builder: (context, state) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AssetPath.homeImage,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Container(
                color: Colors.black.withOpacity(0.3),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: Text(
                    "${quotesList[index].quote}\n\n- ${quotesList[index].author}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ).animate().fade().scale(),
              const Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: QuoteContentWidget(),
              ),
            ],
          );
        },
        itemCount: quotesList.length,
      ),
      extendBody: true,
    );
  }
}
