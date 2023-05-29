import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/history.dart';
import '../home_page_model.dart';

class LastTranslationsWidget extends ConsumerWidget {
  const LastTranslationsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(historyProvider);
    return history.when(
        data: (data) => !ref.watch(translateModeProvider) && data.isNotEmpty
            ? Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    tr('last_translations'),
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.6)
                            : Theme.of(context).textTheme.bodySmall!.color!.withOpacity(.5)),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        error: (error, stacktrace) => const SizedBox.shrink(),
        loading: () => const SizedBox.shrink());
  }
}
