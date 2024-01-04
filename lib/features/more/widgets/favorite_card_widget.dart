import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:kavyanepal/config/config.dart';

import '../../../main.dart';
import '../../../utils/custom_bot_toast.dart';
import '../models/models.dart';

class FavoriteCardWidget extends StatelessWidget {
  const FavoriteCardWidget({
    super.key,
    required this.favQuotesDbModel,
  });

  final FavQuotesDbModel favQuotesDbModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 23.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.network(
                  favQuotesDbModel.imageUrl,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(AssetPath.logo);
                  },
                ).image,
                opacity: 0.1,
                alignment: Alignment.center,
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).focusColor,
          ),
          child: Text(
            favQuotesDbModel.quote,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
        Positioned(
          right: 10.0,
          top: 0.0,
          child: PopupMenuButton<int>(
            padding: EdgeInsets.zero,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Iconify(
                      Ic.round_content_copy,
                      color: Theme.of(context).iconTheme.color,
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
                      color: Theme.of(context).iconTheme.color,
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
                    text: favQuotesDbModel.quote,
                  ),
                ).then((value) {
                  CustomBotToast.text('Copied Successfully', isSuccess: true);
                });
              } else if (value == 2) {
                await isar.writeTxn(() async {
                  await isar.favQuotesDbModels.delete(favQuotesDbModel.id);
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
  }
}
