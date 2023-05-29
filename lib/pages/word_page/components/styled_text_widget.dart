import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_text/styled_text.dart';

import '../../../models/word_model.dart';
import '../../../navigator/navigate_effect.dart';
import '../../../outside_functions.dart';
import '../../home_page/home_page_model.dart';
import '../word_page.dart';
import '../word_page_model.dart';

class StyledTextWidget extends StatefulWidget {
  const StyledTextWidget({super.key, required this.word, this.maxLines, this.isShowingExamples = true});

  final WordModel word;
  final int? maxLines;
  final bool isShowingExamples;

  @override
  State<StyledTextWidget> createState() => _StyledTextWidgetState();
}

class _StyledTextWidgetState extends State<StyledTextWidget> {
  List<String> textLines = [];
  @override
  void initState() {
    textLines = splitStringByTab(widget.word.body ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const mPadding = 10;
    return textLines.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (widget.isShowingExamples
                    ? textLines
                    : textLines.where((element) => !element.contains('<m2>') && !element.contains('<m3>')))
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(
                      left: e.contains('m1')
                          ? mPadding * 1
                          : e.contains('m2')
                              ? mPadding * 2
                              : e.contains('m3')
                                  ? mPadding * 3
                                  : mPadding * 0,
                      right: 32,
                    ),
                    child: Consumer(builder: (context, ref, child) {
                      final zoom = ref.watch(articleZoomProvider);
                      return StyledText(
                        text: e,
                        style: theme.textTheme.bodySmall!.copyWith(
                            fontSize: 17 * zoom,
                            height: 1.3,
                            color: theme.textTheme.bodyMedium!.color,
                            fontFamily: 'Araboto',
                            fontWeight: FontWeight.w500),
                        maxLines: widget.maxLines,
                        tags: {
                          'ref': StyledTextActionTag(
                            (String? text, Map<String?, String?> attrs) {
                              if (widget.word.refs!.containsKey(text)) {
                                ref.read(splitModeProvider)
                                    ? ref.read(selectedBottomPanelWordIdProvider.notifier).id = widget.word.refs![text]!
                                    : Navigator.of(context)
                                        .push(NavigateEffects.fadeTransitionToPage(WordPage(widget.word.refs![text]!)));
                              } else {
                                OutsideFunctions.showRefSnackBar(context, text ?? '');
                              }
                            },
                            style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? const Color.fromARGB(255, 0, 129, 255)
                                    : const Color.fromARGB(255, 0, 0, 238)),
                          ),
                          'b': StyledTextTag(
                              style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                          'u': StyledTextTag(style: const TextStyle(decoration: TextDecoration.underline)),
                          'c': StyledTextTag(style: const TextStyle(color: Color.fromRGBO(0, 127, 0, 1))),
                          'i': StyledTextTag(style: const TextStyle(fontStyle: FontStyle.italic)),
                          'ex': StyledTextTag(
                              style: TextStyle(
                                  color: theme.brightness == Brightness.dark
                                      ? const Color.fromARGB(255, 206, 207, 255)
                                      : const Color.fromARGB(255, 0, 0, 97))),
                          'm2': StyledTextTag(style: TextStyle(fontSize: 15 * zoom)),
                          'm3': StyledTextTag(style: TextStyle(fontSize: 15 * zoom)),
                        },
                      );
                    }),
                  ),
                )
                .toList(),
          );
  }

  List<String> splitStringByTab(String textToSplit) {
    return textToSplit
        .split(utf8.decode([10]))
        .where((element) => element.trim().isNotEmpty)
        .map((e) => formatText(e).trim())
        .toList();
  }

  String formatText(String textToFormat) {
    return textToFormat.replaceAll('[', '<').replaceAll(']', '>');
  }
}
