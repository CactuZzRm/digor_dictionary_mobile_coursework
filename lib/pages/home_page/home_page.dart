import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upgrader/upgrader.dart';

import '../../providers/textfield_provider.dart';
import '../word_page/word_page.dart';
import 'components/app_bar_widget.dart';
import 'components/drawer_widget.dart';
import 'components/last_translations_widget.dart';
import 'components/search_textfield.dart';
import 'components/word_list_widget.dart';
import 'home_page_model.dart';

GlobalKey<ScaffoldState> homePageKey = GlobalKey();

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UpgradeAlert(
      child: WillPopScope(
        onWillPop: () async {
          if (ref.read(textFieldValueProvider).isEmpty) {
            return true;
          }
          ref.read(textFieldValueProvider.notifier).state = '';
          ref.read(translateModeProvider.notifier).setFalse();
          textController.clear();
          return false;
        },
        child: Scaffold(
          key: homePageKey,
          resizeToAvoidBottomInset: false,
          drawer: const DrawerWidget(),
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBarWidget(),
          ),
          body: Column(
            children: [
              const Expanded(
                child: Column(
                  children: [
                    SearchTextfield(),
                    LastTranslationsWidget(),
                    WordListWidget(),
                  ],
                ),
              ),
              if (ref.watch(splitModeProvider)) ...[
                SizedBox(
                    height: 2,
                    child: Divider(
                        thickness: 2, color: Theme.of(context).primaryColor)),
                Expanded(
                  child: WordPage(ref.watch(selectedBottomPanelWordIdProvider),
                      needAppBar: false),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
