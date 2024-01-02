import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.leadingWidget,
    this.onLeadingTap,
    this.onActionTap,
    this.actionWidget,
  });
  final Widget? leadingWidget;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onActionTap;
  final Widget? actionWidget;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: InkWell(
        onTap: onLeadingTap ??
            () {
              context.pop();
            },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: leadingWidget ??
              Iconify(
                MaterialSymbols.arrow_back_ios_rounded,
                color: Theme.of(context).iconTheme.color,
              ),
        ),
      ),
      actions: [
        InkWell(
          onTap: onActionTap ?? () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: actionWidget ??
                const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          ),
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }
}
