import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/search.dart';
import '../socket_exception_widget.dart';
import 'components/app_bar_widget.dart';
import 'components/side_menu_buttons.dart';
import 'components/styled_text_widget.dart';
import 'components/title_widget.dart';
import 'word_page_model.dart';

class WordPage extends ConsumerWidget {
  final int id;
  final bool needAppBar;
  const WordPage(this.id, {super.key, this.needAppBar = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (id == -1) {
      return Center(child: Text(tr('nothing_select')));
    }
    final theme = Theme.of(context);
    final wordProvider = ref.watch(fetchWordProvider(id: id));
    return wordProvider.when(
      data: (word) {
        return Scaffold(
          appBar: needAppBar
              ? PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: WordPageAppBar(body: word.body ?? ''))
              : null,
          body: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const DictionaryNameWidget(),
                  SizedBox(
                      height: 1,
                      child: Divider(
                          thickness: 1,
                          color: theme.primaryColor.withOpacity(.5))),
                  const SizedBox(height: 18),
                  TitleWidget(word.title, word.audioUrl),
                  const SizedBox(height: 28),
                  StyledTextWidget(
                    word: word,
                    isShowingExamples:
                        ref.watch(exampleModeProvider) == ExampleModeEnum.show,
                  ),
                ],
              ),
              SideMenuButtons(wordModel: word),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Scaffold(
        appBar: needAppBar ? AppBar(title: Text(tr('Error'))) : null,
        body: error is DioError && error.error is SocketException
            ? SocketExceptionWidget(
                () => ref.refresh(fetchWordProvider(id: id)), true)
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(tr('something_went_wrong')),
                ),
              ),
      ),
      loading: () => Scaffold(
        appBar: needAppBar ? AppBar(title: Text(tr('translation'))) : null,
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class DictionaryNameWidget extends ConsumerWidget {
  const DictionaryNameWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final zoom = ref.watch(articleZoomProvider);
    final dicName = ref.read(searchModeProvider.notifier).getFullLanguageMode();
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 14),
      child: Text(
        'Essential ($dicName)',
        style: theme.textTheme.bodyLarge!.copyWith(
          fontSize: 17 * zoom,
          fontWeight: FontWeight.w500,
          fontFamily: 'Araboto',
        ),
      ),
    );
  }
}
