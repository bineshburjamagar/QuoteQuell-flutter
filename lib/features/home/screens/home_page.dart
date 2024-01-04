import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kavyanepal/config/config.dart';
import 'package:kavyanepal/features/home/models/quotes_model_meta.dart';
import 'package:kavyanepal/features/home/providers/quote_api_provider.dart';
import 'package:kavyanepal/features/home/widgets/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';

import '../../more/dbquery/favorite_db_query.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  static const String routeName = "/homepage";
  static GoRoute route() {
    return GoRoute(
      path: routeName,
      builder: (context, state) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quotesList = ref.watch(quoteStateProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return ref.read(quoteStateProvider.notifier).init();
        },
        child: PageView.builder(
          onPageChanged: (value) {
            ref.read(quoteStateProvider.notifier).getNextData(value);
          },
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return QuotesWidget(quotes: quotesList[index]);
          },
          itemCount: quotesList.length,
        ),
      ),
    );
  }
}

class QuotesWidget extends StatefulHookConsumerWidget {
  const QuotesWidget({
    super.key,
    required this.quotes,
  });

  final QuotesModel quotes;

  @override
  ConsumerState<QuotesWidget> createState() => _QuotesWidgetState();
}

class _QuotesWidgetState extends ConsumerState<QuotesWidget> {
  late ScreenshotController screenshotController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screenshotController = ScreenshotController();
  }

  @override
  Widget build(BuildContext context) {
    final favDbQuery = ref.watch(faveDbProvider);

    final showAnimation = useState<bool>(false);

    startAnimation() {
      if (!showAnimation.value) {
        showAnimation.value = true;

        Future.delayed(const Duration(seconds: 2), () {
          showAnimation.value = false;
        });
      }
    }

    return GestureDetector(
      onDoubleTap: () {
        if (favDbQuery.getId(model: widget.quotes) == null) {
          startAnimation();
          setState(() {
            favDbQuery.toggleFav(model: widget.quotes);
          });
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Screenshot(
            controller: screenshotController,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.quotes.image,
                  errorWidget: (context, error, stackTrace) {
                    return Image.asset(
                      AssetPath.homeImage,
                      fit: BoxFit.fitHeight,
                    );
                  },
                  fit: BoxFit.fitHeight,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Container(
                  color: Colors.black.withOpacity(0.7),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
                    child: Text(
                      "${widget.quotes.content}\n\n- ${widget.quotes.author}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ).animate().fade().scale(),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Visibility(
                    visible: showAnimation.value,
                    child: LottieBuilder.asset(
                      'assets/animations/like.json',
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: QuoteContentWidget(
              quoteModel: widget.quotes,
              controller: screenshotController,
            ),
          ),
        ],
      ),
    );
  }
}
