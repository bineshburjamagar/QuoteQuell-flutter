import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:kavyanepal/config/asset_path.dart';

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
    final currentIndex = useState<int>(0);
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          // Check the direction of the drag
          if (details.primaryVelocity! > 0) {
            // Swiped from left to right (right to left motion)
            currentIndex.value = (currentIndex.value - 1) % quotes.length;
            if (currentIndex.value < 0) {
              currentIndex.value = quotes.length - 1;
            }
          } else {
            // Swiped from right to left (left to right motion)

            currentIndex.value = (currentIndex.value + 1) % quotes.length;
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
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
                        quotes[currentIndex.value],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 100,
                    child: Text('Swipe for the next one'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
              tileMode: TileMode.mirror,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(homePageBottomNavList.length, (index) {
                  return InkWell(
                    onTap: homePageBottomNavList[index].onTap,
                    child: Iconify(
                      homePageBottomNavList[index].icon,
                      color: Theme.of(context).iconTheme.color,
                      size: 30.0,
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
