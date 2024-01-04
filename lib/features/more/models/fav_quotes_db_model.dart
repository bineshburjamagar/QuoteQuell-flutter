import 'package:isar/isar.dart';
part 'fav_quotes_db_model.g.dart';

@collection
class FavQuotesDbModel {
  Id id = Isar.autoIncrement;
  final String quoteId;
  final String quote;
  final String author;
  final String imageUrl;
  final DateTime createdDate;

  FavQuotesDbModel({
    required this.quoteId,
    required this.author,
    required this.quote,
    required this.imageUrl,
    required this.createdDate,
  });
}
