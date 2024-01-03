import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';

import '../models/home_page_model.dart';

class QuoteContentWidget extends StatelessWidget {
  const QuoteContentWidget({
    super.key,
  });
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
                    homePageBottomNavList[ind].icon,
                    color: Theme.of(context).iconTheme.color,
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
