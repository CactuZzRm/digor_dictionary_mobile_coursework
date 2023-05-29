import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/history.dart';
import '../../../providers/search.dart';
import '../../../providers/textfield_provider.dart';
import '../../socket_exception_widget.dart';
import '../home_page_model.dart';
import 'word_card_widget.dart';

class WordListWidget extends ConsumerWidget {
  const WordListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ref.watch(translateModeProvider) ? const _SearchList() : const _HistoryList(),
    );
  }
}

class _HistoryList extends ConsumerWidget {
  const _HistoryList();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordList = ref.watch(historyProvider);
    return wordList.when(
      data: (data) {
        return ListView.separated(
          padding: const EdgeInsets.only(top: 4),
          itemBuilder: (context, index) => WordCardWidget(word: data[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 1, child: Divider(thickness: 1)),
          itemCount: data.length,
          physics: const BouncingScrollPhysics(),
        );
      },
      error: (error, stackTrace) {
        return error is DioError && error.error is SocketException
            ? SocketExceptionWidget(() => ref.refresh(historyProvider), false)
            : const SizedBox.shrink();
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _SearchList extends ConsumerWidget {
  const _SearchList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordList = ref.watch(searchProvider(text: ref.watch(textFieldValueProvider)));
    return wordList.when(
      data: (data) {
        if (data.isEmpty) {
          return Center(
            child: Text(
              '${tr('translation_not_found')}.',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 20),
            ),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) => WordCardWidget(word: data[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 1, child: Divider(thickness: 1)),
          itemCount: data.length,
          physics: const BouncingScrollPhysics(),
        );
      },
      error: (error, stackTrace) => error is DioError && error.error is SocketException
          ? SocketExceptionWidget(() => ref.refresh(searchProvider(text: ref.watch(textFieldValueProvider))), false)
          : Center(
              child: Text(
                '${tr('translation_not_found')}.',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 20),
              ),
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
