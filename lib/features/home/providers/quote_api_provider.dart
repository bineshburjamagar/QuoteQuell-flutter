import 'dart:math';
import 'dart:developer' as d;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kavyanepal/features/home/apis/apis.dart';
import 'package:kavyanepal/features/home/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'quote_api_provider.g.dart';

@riverpod
Future<QuotesModelMeta> getQuotes(GetQuotesRef ref,
    {required int pageNumber}) async {
  return ref.read(quotesApiProvider).getQuotesModel(pageNumber: pageNumber);
}

final quoteStateProvider =
    StateNotifierProvider<QuotesStateNotifier, List<QuotesModel>>((ref) {
  return QuotesStateNotifier(ref: ref);
});

class QuotesStateNotifier extends StateNotifier<List<QuotesModel>> {
  QuotesStateNotifier({required this.ref}) : super([]) {
    d.log("\x1B[32m inited \x1B[0m");
  }
  final Ref ref;
  bool isLast = false;
  int page = Random().nextInt(50);
  bool isLoading = true;

  Future init({bool isNext = false}) async {
    var data = await ref.read(getQuotesProvider(pageNumber: page).future);
    isLast = (data.page == data.totalPages);
    isLoading = false;
    page = getNextPage(data.totalPages);

    d.log('${state.length}');
    d.log('${data.page}');

    if (isNext) {
      state = [...state, ...data.results];
    } else {
      state = data.results;
    }
  }

  Future getNextData(int currentIndex) async {
    d.log(
        "\n\n******************************\n\n\n\n******************************\n\n");

    d.log('${state.length}');
    d.log('$currentIndex');

    d.log('$page');
    d.log(
        "\n\n******************************\n\n\n\n******************************\n\n");

    if (!isLast && !isLoading && (currentIndex == state.length - 2)) {
      isLoading = true;
      await init(isNext: true);
    } else {
      d.log(
          "\n\n******************************\n\nno fetch\n\n******************************\n\n");
    }
  }

  int getNextPage(int totalPage) {
    var nextPage = Random().nextInt(totalPage);
    if (nextPage == page) {
      nextPage = getNextPage(totalPage);
    }

    return nextPage;
  }
}
