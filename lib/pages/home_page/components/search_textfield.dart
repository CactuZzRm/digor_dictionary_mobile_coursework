import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../navigator/navigate_effect.dart';
import '../../../providers/search.dart';
import '../../../providers/textfield_provider.dart';
import '../../word_page/word_page.dart';
import '../home_page_model.dart';

class SearchTextfield extends ConsumerWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final wordList = ref.watch(searchProvider(text: ref.watch(textFieldValueProvider)));
    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        child: Column(
          children: [
            TextField(
              cursorHeight: 24,
              onSubmitted: (_) {
                if (ref.read(translateModeProvider) && wordList.value != null && wordList.value!.isNotEmpty) {
                  Navigator.of(context).push(NavigateEffects.fadeTransitionToPage(WordPage(wordList.value!.first.id)));
                }
              },
              showCursor: true,
              focusNode: ref.read(textFieldValueProvider.notifier).focusNode,
              controller: textController,
              autofocus: true,
              style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20),
              onChanged: (value) {
                if (ref.read(splitModeProvider)) ref.read(selectedWordIdProvider.notifier).changeSelectedId = -1;
                if (value.isEmpty) {
                  ref.read(translateModeProvider.notifier).setFalse();
                } else {
                  ref.read(translateModeProvider.notifier).setTrue();
                }
                ref.read(textFieldValueProvider.notifier).onChangeText = value;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.only(top: 10),
                hintText: tr('enter_the_word'),
                hintStyle: theme.brightness == Brightness.dark
                    ? theme.textTheme.bodyMedium!
                        .copyWith(color: theme.textTheme.bodySmall!.color!.withOpacity(0.6), fontSize: 18)
                    : theme.textTheme.bodyMedium!
                        .copyWith(color: theme.textTheme.bodySmall!.color!.withOpacity(0.5), fontSize: 18),
                suffixIconConstraints: const BoxConstraints(maxHeight: 24),
                suffixIcon: (ref.watch(translateModeProvider))
                    ? SizedBox(
                        width: 35,
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          splashRadius: 20,
                          onPressed: () {
                            ref.read(textFieldValueProvider.notifier).state = '';
                            ref.read(translateModeProvider.notifier).setFalse();
                            textController.clear();
                          },
                          icon: Icon(Icons.close, color: theme.textTheme.bodySmall!.color, size: 25),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Container(
              height: 2,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 3, top: 3),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
