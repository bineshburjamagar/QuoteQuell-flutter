import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/carbon.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:kavyanepal/config/asset_path.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';

class HomePage extends ConsumerWidget {
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
      body: CustomScrollView(
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
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.0),
                    child: Text(
                      '"Success is not final, failure is not fatal: It is the courage to continue that counts."\n - Winston Churchill',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
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
                children: [
                  Iconify(
                    Ph.share_bold,
                    color: Theme.of(context).iconTheme.color,
                    size: 30.0,
                  ),
                  Iconify(
                    MaterialSymbols.favorite_outline_rounded,
                    color: Theme.of(context).iconTheme.color,
                    size: 30.0,
                  ),
                  Iconify(
                    Ph.paint_brush_broad,
                    color: Theme.of(context).iconTheme.color,
                    size: 30.0,
                  ),
                  Iconify(
                    Carbon.settings,
                    color: Theme.of(context).iconTheme.color,
                    size: 30.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
