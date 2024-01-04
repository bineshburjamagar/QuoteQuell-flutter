import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:isar/isar.dart';
import 'package:kavyanepal/components/components.dart';
import 'package:kavyanepal/config/config.dart';
import 'package:kavyanepal/main.dart';
import 'package:kavyanepal/utils/custom_bot_toast.dart';

import '../models/models.dart';

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
          stream: isar.favQuotesDbModels.where().watch(fireImmediately: true),
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
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 23.0, vertical: 10.0),
                    sliver: SliverList.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20.0),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Theme.of(context).focusColor,
                                ),
                                child: Text(
                                  favoriteList[index].quote,
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Positioned(
                                right: 0.0,
                                top: 0.0,
                                child: PopupMenuButton<int>(
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context) => [
                                    // PopupMenuItem 1
                                    PopupMenuItem(
                                      value: 1,
                                      // row with 2 children
                                      child: Row(
                                        children: [
                                          Iconify(
                                            Ic.round_content_copy,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text("Copy")
                                        ],
                                      ),
                                    ),
                                    // PopupMenuItem 2
                                    PopupMenuItem(
                                      value: 2,
                                      // row with two children
                                      child: Row(
                                        children: [
                                          Iconify(
                                            Ic.round_delete_forever,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                          ) // widget

                                          ,
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text("Delete")
                                        ],
                                      ),
                                    ),
                                  ],
                                  offset: const Offset(10, 50),
                                  elevation: 2,
                                  onSelected: (value) async {
                                    if (value == 1) {
                                      await Clipboard.setData(
                                        ClipboardData(
                                          text: favoriteList[index].quote,
                                        ),
                                      ).then((value) {
                                        CustomBotToast.text(
                                            'Copied Successfully',
                                            isSuccess: true);
                                      });
                                    } else if (value == 2) {
                                      await isar.writeTxn(() async {
                                        await isar.favQuotesDbModels
                                            .delete(favoriteList[index].id);
                                        CustomBotToast.text(
                                          'Removed Successfully',
                                          isSuccess: false,
                                        );
                                      });
                                    }
                                  },
                                ),
                              ) // widget
                            ],
                          );
                        },
                        itemCount: favoriteList.length),
                  )
                ] else ...[
                  const SliverToBoxAdapter()
                ]
              ],
            );
          }),
    );
  }
}
