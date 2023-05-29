import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../word_page_model.dart';

class WordPageAppBar extends ConsumerWidget {
  final String body;
  const WordPageAppBar({super.key, required this.body});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowingExamples = ref.watch(exampleModeProvider) == ExampleModeEnum.show;
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.primaryColor,
      title: Text(tr('translation')),
      actions: [
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.more_vert),
            ),
            items: [
              DropdownMenuItem(
                enabled: body.contains('[m2]') || body.contains('[m3]'),
                value: isShowingExamples ? tr('hide_examples') : tr('show_examples'),
                onTap: ref.read(exampleModeProvider.notifier).toggleExampleMode,
                child: Text(
                  isShowingExamples ? tr('hide_examples') : tr('show_examples'),
                  style: TextStyle(
                      color: theme.textTheme.bodyMedium!.color!.withOpacity(
                    body.contains('[m2]') || body.contains('[m3]') ? 1 : .2,
                  )),
                ),
              ),
            ],
            onChanged: (value) {},
            dropdownStyleData: DropdownStyleData(
              width: 180,
              padding: EdgeInsets.zero,
              elevation: 1,
              isOverButton: true,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
              offset: const Offset(-140, -4),
            ),
          ),
        ),
      ],
    );
  }
}
