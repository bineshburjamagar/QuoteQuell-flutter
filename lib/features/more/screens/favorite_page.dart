import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:kavyanepal/components/components.dart';
import 'package:kavyanepal/config/config.dart';
import 'package:kavyanepal/main.dart';

import '../models/models.dart';
import '../widgets/favorite_card_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});
  static const String routeName = "/favoritepage";
  static GoRoute route() {
    return GoRoute(
      path: routeName,
      builder: (context, state) => const FavoritePage(),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: StreamBuilder<List<FavQuotesDbModel>>(
          stream: isar.favQuotesDbModels
              .where()
              .sortByCreatedDateDesc()
              .watch(fireImmediately: true),
          builder: (context, snapshot) {
            var favoriteList = snapshot.data ?? [];
            return CustomScrollView(
              slivers: [
                const CustomSliverAppBar(
                  actionWidget: SizedBox(),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 23.0, vertical: 10.0),
                    child: Text(
                      'Favorites',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                if (snapshot.hasData) ...[
                  if (snapshot.data!.isEmpty) ...{
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 100.0, left: 20.0, right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetPath.noFav,
                              height: 200.0,
                            ),
                            const SizedBox(height: 20.0),
                            const Text(
                              'You don\'t have any favorites yet.',
                              style: TextStyle(fontSize: 28.0),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  },
                  SliverList.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20.0),
                      itemBuilder: (context, index) {
                        return FavoriteCardWidget(
                            favQuotesDbModel: favoriteList[index]);
                      },
                      itemCount: favoriteList.length),
                ] else ...[
                  const SliverToBoxAdapter()
                ]
              ],
            );
          }),
    );
  }
}
