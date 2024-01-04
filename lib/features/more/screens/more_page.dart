import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:isar/isar.dart';
import 'package:kavyanepal/components/components.dart';
import 'package:kavyanepal/features/more/models/models.dart';
import 'package:kavyanepal/features/more/screens/screens.dart';
import 'package:kavyanepal/main.dart';

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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(
            titleText: 'More',
            actionWidget: SizedBox(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                onTap: () async {
                  context.push(FavoritePage.routeName);
                },
                leading: const Text(
                  'Favorites',
                  style: TextStyle(fontSize: 20.0),
                ),
                trailing: Iconify(
                  MaterialSymbols.arrow_forward_ios_rounded,
                  color: Theme.of(context).iconTheme.color,
                ),
              );
            }, childCount: 1),
          )
        ],
      ),
    );
  }
}
