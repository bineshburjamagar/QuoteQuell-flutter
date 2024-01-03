class QuotesModelMeta {
  final int count;
  final int totalCount;
  final int page;
  final int totalPages;
  final int lastItemIndex;
  final List<QuotesModel> results;

  QuotesModelMeta({
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPages,
    required this.lastItemIndex,
    required this.results,
  });

  factory QuotesModelMeta.fromJson(Map<String, dynamic> json) =>
      QuotesModelMeta(
        count: json["count"],
        totalCount: json["totalCount"],
        page: json["page"],
        totalPages: json["totalPages"],
        lastItemIndex: json["lastItemIndex"],
        results: List<QuotesModel>.from(json["results"] != null
            ? json["results"].map((x) => QuotesModel.fromJson(x))
            : []),
      );
}

class QuotesModel {
  final String id;
  final String? author;
  final String? content;
  final List<String> tags;
  final String? authorSlug;
  final int length;
  final DateTime? dateAdded;
  final DateTime? dateModified;

  QuotesModel({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        id: json["_id"],
        author: json["author"],
        content: json["content"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        authorSlug: json["authorSlug"],
        length: json["length"],
        dateAdded: DateTime.parse(json["dateAdded"]),
        dateModified: DateTime.parse(json["dateModified"]),
      );

  String get image =>
      'https://source.unsplash.com/random/?$content&&orientation=portrait';

  bool get isFavorite => false;

  QuotesModel copyWith() {
    return QuotesModel(
        id: id,
        author: author,
        content: content,
        tags: tags,
        authorSlug: authorSlug,
        length: length,
        dateAdded: dateAdded,
        dateModified: dateModified);
  }
}
