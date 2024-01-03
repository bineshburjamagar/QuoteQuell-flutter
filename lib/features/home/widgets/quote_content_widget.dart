import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:kavyanepal/features/home/models/models.dart';

class QuoteContentWidget extends StatelessWidget {
  const QuoteContentWidget({super.key, required this.quoteModel});
  final QuotesModel quoteModel;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              children: List.generate(homePageBottomNavList.length, (ind) {
                return InkWell(
                  onTap: () {
                    switch (ind) {
                      case 0:
                        break;
                      default:
                    }
                  },
                  child: Iconify(
                    (ind == 1 && quoteModel.isFavorite)
                        ? MaterialSymbols.favorite_rounded
                        : homePageBottomNavList[ind].icon,
                    color: (ind == 1 && quoteModel.isFavorite)
                        ? Colors.red
                        : Theme.of(context).iconTheme.color,
                    size: 30.0,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
