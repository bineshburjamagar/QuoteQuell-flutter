import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:kavyanepal/features/home/models/models.dart';
import 'package:kavyanepal/features/more/more.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../utils/custom_bot_toast.dart';

class QuoteContentWidget extends StatelessWidget {
  const QuoteContentWidget(
      {super.key, required this.quoteModel, required this.controller});
  final QuotesModel quoteModel;
  final ScreenshotController controller;
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
                  onTap: () async {
                    switch (ind) {
                      case 0:
                        Share.share(quoteModel.content ?? "");
                        break;
                      case 2:
                        Uint8List? image = await controller.capture();

                        final result =
                            await ImageGallerySaver.saveImage(image!);

                        if (result != null) {
                          CustomBotToast.text(
                            'Image Downloaded',
                            isSuccess: true,
                          );
                        }
                        break;
                      case 3:
                        context.push(MorePage.routeName);
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
