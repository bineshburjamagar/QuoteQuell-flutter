import 'package:isar/isar.dart';
import 'package:kavyanepal/features/home/models/quotes_model_meta.dart';
import 'package:kavyanepal/features/more/models/models.dart';
import 'package:kavyanepal/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final faveDbProvider = Provider<_FavoriteDbQuery>((ref) {
  return _FavoriteDbQuery();
});

class _FavoriteDbQuery {
  Future<void> createOrUpdateFavQuotes(QuotesModel model) async {
    var favDbModel = FavQuotesDbModel(
        quoteId: model.id,
        author: model.author ?? '',
        quote: model.content ?? '',
        imageUrl: model.image);

    var oldId = getId(model: model);
    if (oldId != null) {
      favDbModel.id = oldId;
    }
    await isar.writeTxn(() async {
      await isar.favQuotesDbModels.put(favDbModel);
    });
  }

  int? getId({required QuotesModel model}) {
    return (isar.favQuotesDbModels
        .filter()
        .quoteIdEqualTo(model.id)
        .findFirstSync()
        ?.id);
  }

  Future<void> toggleFav({required QuotesModel model}) async {
    int? isarId = getId(model: model);

    if (isarId != null) {
      await isar.writeTxn(() async {
        return await isar.favQuotesDbModels.delete(isarId);
      });
    } else {
      createOrUpdateFavQuotes(model);
    }
  }
}
