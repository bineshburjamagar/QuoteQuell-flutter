import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:isar/isar.dart';
import 'package:kavyanepal/features/home/models/models.dart';
import 'package:kavyanepal/features/more/dbquery/favorite_db_query.dart';
import 'package:kavyanepal/features/more/models/models.dart';
import 'package:kavyanepal/main.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../utils/custom_bot_toast.dart';
import '../../more/screens/screens.dart';

class QuoteContentWidget extends StatefulHookConsumerWidget {
  const QuoteContentWidget(
      {super.key, required this.quoteModel, required this.controller});
  final QuotesModel quoteModel;
  final ScreenshotController controller;

  @override
  ConsumerState<QuoteContentWidget> createState() => _QuoteContentWidgetState();
}

class _QuoteContentWidgetState extends ConsumerState<QuoteContentWidget> {
  @override
  Widget build(BuildContext context) {
    final favDbQuery = ref.watch(faveDbProvider);
    bool isFav = (favDbQuery.getId(model: widget.quoteModel) != null);
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
                        Share.share(widget.quoteModel.content ?? "");
                        break;
                      case 1:
                        setState(() {
                          favDbQuery.toggleFav(model: widget.quoteModel);
                        });
                        break;
                      case 2:
                        Uint8List? image = await widget.controller.capture();

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
                  child: StreamBuilder<List<FavQuotesDbModel>>(
                      stream: isar.favQuotesDbModels
                          .where()
                          .build()
                          .watch(fireImmediately: true),
                      builder: (context, snapshot) {
                        return Iconify(
                          (ind == 1 && isFav)
                              ? MaterialSymbols.favorite_rounded
                              : homePageBottomNavList[ind].icon,
                          color: (ind == 1 && isFav)
                              ? Colors.red
                              : Theme.of(context).iconTheme.color,
                          size: 30.0,
                        );
                      }),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
