import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/word_model.dart';
import '../../../outside_functions.dart';
import '../word_page_model.dart';

class SideMenuButtons extends ConsumerWidget {
  final WordModel wordModel;
  const SideMenuButtons({super.key, required this.wordModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zoom = ref.watch(articleZoomProvider);
    final theme = Theme.of(context);
    return Positioned(
      top: 16,
      right: 8,
      child: Column(
        children: [
          IconButton(
            onPressed: () => OutsideFunctions.showCopiedSnackBar(context, wordModel.title.trim()),
            icon: SvgPicture.asset('assets/svg_icons/ico-copy.svg',
                color: theme.brightness == Brightness.dark
                    ? theme.textTheme.bodyMedium!.color!.withOpacity(.6)
                    : theme.textTheme.bodyMedium!.color!.withOpacity(.4)),
            splashRadius: 20,
          ),
          const SizedBox(height: 4),
          IconButton(
            onPressed: () {
              ref.read(articleZoomProvider.notifier).incrementZoom();
              OutsideFunctions.showZoomSnackBar(context, ref.read(articleZoomProvider));
            },
            icon: Icon(Icons.zoom_in,
                color: theme.brightness == Brightness.dark
                    ? theme.textTheme.bodyMedium!.color!.withOpacity(.6)
                    : theme.textTheme.bodyMedium!.color!.withOpacity(.4)),
            splashRadius: 20,
          ),
          if (zoom > 0.3) ...[
            const SizedBox(height: 4),
            IconButton(
              onPressed: () {
                ref.read(articleZoomProvider.notifier).decrementZoom();
                OutsideFunctions.showZoomSnackBar(context, ref.read(articleZoomProvider));
              },
              icon: Icon(Icons.zoom_out,
                  color: theme.brightness == Brightness.dark
                      ? theme.textTheme.bodyMedium!.color!.withOpacity(.6)
                      : theme.textTheme.bodyMedium!.color!.withOpacity(.4)),
              splashRadius: 20,
            ),
          ],
          const SizedBox(height: 4),
          IconButton(
            onPressed: () {
              OutsideFunctions.showWriteToDeveloperDialog(context, tr('report_an_error'), ref);
            },
            icon: Icon(
              Icons.error_outline_rounded,
              color: theme.brightness == Brightness.dark
                  ? theme.textTheme.bodyMedium!.color!.withOpacity(.6)
                  : theme.textTheme.bodyMedium!.color!.withOpacity(.4),
              size: 22,
            ),
            splashRadius: 20,
          ),
        ],
      ),
    );
  }
}
