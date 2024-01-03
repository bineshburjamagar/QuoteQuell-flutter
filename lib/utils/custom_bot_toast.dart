import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:utils_plus/utils_plus.dart';

enum ToastType {
  success,
  error,
  info;

  Color get color {
    switch (this) {
      case ToastType.success:
        return const Color(0xFF3A8F3D);
      case ToastType.error:
        return const Color(0xFF93241C);
      case ToastType.info:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  String? get icon {
    switch (this) {
      case ToastType.success:
        return MaterialSymbols.check_small;
      case ToastType.error:
        return MaterialSymbols.close;
      case ToastType.info:
        return MaterialSymbols.info;
      default:
        return null;
    }
  }
}

class CustomBotToast {
  static text(
    String text, {
    bool isSuccess = true,
    Duration duration = const Duration(seconds: 2),
  }) {
    return BotToast.showText(
      text: text,
      duration: duration,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      contentColor: isSuccess ? Colors.green.shade600 : Colors.red,
    );
  }

  static showTopSlideToast({
    required String title,
    required ToastType toastType,
    String? filePath,
    String? body,
  }) {
    return BotToast.showAnimationWidget(
      animationDuration: const Duration(milliseconds: 200),
      duration: const Duration(seconds: 5),
      wrapToastAnimation: (controller, cancel, child) => CustomOffsetAnimation(
        reverse: true,
        controller: controller,
        child: child,
      ),
      clickClose: true,
      toastBuilder: (cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.fromLTRB(10, 1, 1, 1),
            decoration: BoxDecoration(
              color: toastType.color,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: GestureDetector(
              onTap: () {
                if (filePath != null) {
                  // OpenAppFile.open(filePath);
                } else {
                  cancelFunc.call();
                }
              },
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 400,
                  minWidth: 400,
                  minHeight: 60,
                  // maxHeight: 60,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    if (toastType.icon != null) ...[
                      CircleAvatar(
                        backgroundColor: toastType.color,
                        radius: 20,
                        child: Iconify(
                          toastType.icon!,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title.toCapitalizeEachWord,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          if (body != null) ...[
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              body,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomOffsetAnimation extends StatefulWidget {
  final AnimationController controller;
  final Widget child;
  final bool reverse;

  const CustomOffsetAnimation({
    Key? key,
    required this.controller,
    required this.child,
    this.reverse = false,
  }) : super(key: key);

  @override
  State<CustomOffsetAnimation> createState() => _CustomOffsetAnimationState();
}

class _CustomOffsetAnimationState extends State<CustomOffsetAnimation> {
  late Tween<Offset> tweenOffset;

  late Animation<double> animation;

  @override
  void initState() {
    tweenOffset = Tween<Offset>(
      begin: Offset(widget.reverse ? -0.8 : 0.8, 0.0),
      end: Offset.zero,
    );
    animation =
        CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (BuildContext context, Widget? child) {
        return FractionalTranslation(
          translation: tweenOffset.evaluate(animation),
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
