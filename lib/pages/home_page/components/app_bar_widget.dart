import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/word_model.dart';
import '../../../outside_functions.dart';
import '../../../providers/history.dart';
import '../../../providers/search.dart';
import '../../../providers/textfield_provider.dart';
import '../../word_page/word_page_model.dart';
import '../home_page_model.dart';

class AppBarWidget extends ConsumerWidget{
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    String dropDownValueFirst = '';
    String dropDownValueSecond = '';
    List<String> dropDownFirstValues = [];
    List<String> dropDownSecondValues = [];
    final searchMode = ref.watch(searchModeProvider).value;
    switch (searchMode!) {
      case LanguageMode.digEnglish:
        dropDownValueFirst = tr('digor');
        dropDownValueSecond = tr('english');
        dropDownSecondValues = [
          tr('english'),
          tr('russian'),
          // tr('turkish'),
        ];
        break;
      case LanguageMode.digRussian:
        dropDownValueFirst = tr('digor');
        dropDownValueSecond = tr('russian');
        dropDownSecondValues = [
          tr('russian'),
          tr('english'),
          // tr('turkish'),
        ];
        break;
      // case LanguageMode.digTurkish:
      //   dropDownValueFirst = tr('digor');
      //   dropDownValueSecond = tr('turkish');
      //   dropDownSecondValues = [
      //     tr('turkish'),
      //     tr('russian'),
      //     tr('english'),
      //   ];
      //   break;
      case LanguageMode.engDigor:
        dropDownValueFirst = tr('english');
        dropDownValueSecond = tr('digor');
        dropDownFirstValues = [
          tr('english'),
          tr('russian'),
          // tr('turkish'),
        ];
        break;
      case LanguageMode.rusDigor:
        dropDownValueFirst = tr('russian');
        dropDownValueSecond = tr('digor');
        dropDownFirstValues = [
          tr('russian'),
          tr('english'),
          // tr('turkish'),
        ];
        break;
      // case LanguageMode.turkDigor:
      //   dropDownValueFirst = tr('turkish');
      //   dropDownValueSecond = tr('digor');
      //   dropDownFirstValues = [tr('turkish'), tr('russian'), tr('english')];
      //   break;
    }
    final history = ref.watch(historyProvider).value;

    final isShowingExamples = ref.watch(exampleModeProvider) == ExampleModeEnum.show;
    final selectedId = ref.watch(selectedBottomPanelWordIdProvider);
    final WordModel? word = selectedId == -1 ? null : ref.watch(fetchWordProvider(id: selectedId)).value;

    final dropDawnItems = [
      if (!ref.watch(translateModeProvider))
        DropdownMenuItem(
          enabled: history != null && history.isNotEmpty,
          value: tr('clear_history'),
          onTap: () {},
          child: Text(
            tr('clear_history'),
            style: TextStyle(
              color: theme.textTheme.bodyMedium!.color!.withOpacity(
                history != null && history.isNotEmpty ? 1 : .2,
              ),
            ),
          ),
        ),
      if (ref.watch(splitModeProvider))
        DropdownMenuItem(
          enabled: word?.body?.contains('[ex]') ?? false,
          value: isShowingExamples ? tr('hide_examples') : tr('show_examples'),
          onTap: ref.read(exampleModeProvider.notifier).toggleExampleMode,
          child: Text(
            isShowingExamples ? tr('hide_examples') : tr('show_examples'),
            style: TextStyle(
                color: theme.textTheme.bodyMedium!.color!.withOpacity(
              word == null
                  ? 0.2
                  : word.body == null
                      ? 0.2
                      : word.body!.contains('[ex]')
                          ? 1
                          : .2,
            )),
          ),
        ),
    ];
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: DropdownButton(
              underline: const DropdownButtonHideUnderline(child: SizedBox.shrink()),
              icon: dropDownFirstValues.isEmpty
                  ? const SizedBox.shrink()
                  : const Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Colors.white,
                    ),
              hint: Center(
                child: Text(
                  dropDownValueFirst,
                  style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 14),
                ),
              ),
              items: dropDownFirstValues.map((value) => DropdownMenuItem(value: value, child: Text(value))).toList(),
              onChanged: (value) {
                ref.read(searchModeProvider.notifier).onDropDownFirstChange(value!);
                ref.read(textFieldValueProvider.notifier).focusNode.requestFocus();
              },
              isExpanded: true,
            ),
          ),
          IconButton(
            splashRadius: 20,
            onPressed: ref.read(searchModeProvider.notifier).onSwitchLanguageTap,
            icon: const Icon(
              Icons.compare_arrows_outlined,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: DropdownButton(
              underline: const DropdownButtonHideUnderline(child: SizedBox.shrink()),
              icon: dropDownSecondValues.isEmpty
                  ? const SizedBox.shrink()
                  : const Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Colors.white,
                    ),
              hint: Center(
                child: Text(
                  dropDownValueSecond,
                  style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white, fontSize: 14),
                ),
              ),
              items: dropDownSecondValues.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                ref.read(searchModeProvider.notifier).onDropDownSecondChange(value!);
                ref.read(textFieldValueProvider.notifier).focusNode.requestFocus();
              },
              isExpanded: true,
            ),
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: 45,
          child: dropDawnItems.isEmpty
              ? const SizedBox.shrink()
              : DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    customButton: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.more_vert),
                    ),
                    items: dropDawnItems,
                    onChanged: (_) {
                      if (_ == tr('clear_history')) {
                        OutsideFunctions.showClearHistoryDialog(
                                context, ref.read(historyProvider.notifier).clearHistory, tr('del_full_history'))
                            .whenComplete(() => ref.read(textFieldValueProvider.notifier).focusNode.requestFocus());
                      }
                    },
                    dropdownStyleData: DropdownStyleData(
                      width: 180,
                      padding: EdgeInsets.zero,
                      elevation: 1,
                      isOverButton: true,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
                      offset: const Offset(-140, -4),
                      openInterval: const Interval(0.25, 0.5)
                    ),
                  ),
                ),
        )
      ],
    );
  }
}
