import 'package:kavyanepal/core/apis/api_base.dart';
import 'package:kavyanepal/features/home/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final quotesApiProvider = Provider<QuotesApi>((ref) {
  return QuotesApi();
});

class QuotesApi {
  Future<QuotesModelMeta> getQuotesModel({required int pageNumber}) async {
    var res = await ApiBase.getInstance()
        .getRequest(path: 'https://api.quotable.io/quotes?page=$pageNumber');
    return QuotesModelMeta.fromJson(res.data);
  }
}
