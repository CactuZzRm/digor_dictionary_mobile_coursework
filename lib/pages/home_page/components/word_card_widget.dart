import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/word_model.dart';
import '../../../navigator/navigate_effect.dart';
import '../../../outside_functions.dart';
import '../../../providers/history.dart';
import '../../../providers/textfield_provider.dart';
import '../../word_page/word_page.dart';
import '../home_page_model.dart';

class WordCardWidget extends ConsumerWidget {
  const WordCardWidget({super.key, required this.word});
  final WordModel word;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final glossaryZoom = ref.watch(glossaryZoomProvider);
    return ListTile(
      visualDensity: VisualDensity(
        vertical: glossaryZoom == 1
            ? 0.8
            : glossaryZoom == 1.1
                ? 1.3
                : -.3,
      ),
      selected: ref.watch(translateModeProvider) && word.id == ref.watch(selectedWordIdProvider),
      selectedColor: theme.textTheme.bodyMedium!.color,
      selectedTileColor: theme.brightness == Brightness.light
          ? const Color.fromARGB(255, 229, 243, 252)
          : const Color.fromARGB(255, 0, 36, 72),
      onTap: () {
        ref.read(historyProvider.notifier).addWordToSaved(word);
        ref.read(selectedWordIdProvider.notifier).changeSelectedId = word.id;
        if (ref.read(splitModeProvider)) {
          ref.read(selectedBottomPanelWordIdProvider.notifier).id = word.id;
        } else {
          textController.selection = TextSelection(baseOffset: 0, extentOffset: textController.value.text.length);
          Navigator.of(context).push(NavigateEffects.fadeTransitionToPage(WordPage(word.id)));
        }
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 11),
      title: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word.title.trim(),
                  style: theme.brightness == Brightness.light
                      ? theme.textTheme.bodyMedium!.copyWith(fontSize: 18.5 * glossaryZoom, fontWeight: FontWeight.w600)
                      : theme.textTheme.bodyMedium!
                          .copyWith(fontSize: 18.5 * glossaryZoom, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  word.translate,
                  style: theme.textTheme.bodySmall!.copyWith(
                      fontSize: 14 * glossaryZoom,
                      color: theme.brightness == Brightness.dark
                          ? theme.textTheme.bodySmall!.color!.withOpacity(0.7)
                          : theme.textTheme.bodySmall!.color!.withOpacity(0.5)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          if (!ref.watch(translateModeProvider))
            SizedBox(
              width: 25 * glossaryZoom,
              height: 25 * glossaryZoom,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  splashRadius: 20,
                  onPressed: () => OutsideFunctions.showClearHistoryDialog(
                      context, () => ref.read(historyProvider.notifier).deleteFromHistory(word), tr('del_this_word')),
                  icon: Icon(Icons.close,
                      color: theme.brightness == Brightness.dark
                          ? theme.textTheme.bodySmall!.color!.withOpacity(.5)
                          : theme.textTheme.bodySmall!.color!.withOpacity(.3))),
            ),
        ],
      ),
    );
  }
}
