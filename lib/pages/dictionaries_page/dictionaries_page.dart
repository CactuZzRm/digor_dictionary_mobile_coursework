import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

class DictionariesPage extends StatelessWidget {
  const DictionariesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(tr('dictionaries'))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (context.locale == const Locale('ru', 'RU')) ...[
                  const _dictionaryWidget(
                    title: 'Дигорско-русский словарь',
                    description:
                        'Количество статей  34657\nРазмер файла           4,00 МБ\nСостояние                  включен <a>✅</a>\nОзвучка                      планируется',
                    author: 'Таказов Ф. М. Дигорско-русский словарь. Русско-дигорский словарь. - Владикавказ, 2015.',
                  ),
                  const SizedBox(height: 40),
                  const _dictionaryWidget(
                      title: 'Дигорско-английский словарь',
                      description:
                          'Количество статей  18780\nРазмер файла           3,85 МБ\nСостояние                  включен <a>✅</a> \nОзвучка                      планируется',
                      author:
                          'Выдрин А. П. Дигорско-английский словарь подготовлен для английской версии дигорского языкового корпуса. <ref>http://corpus-digor.ossetic-studies.org</ref>'),
                  const SizedBox(height: 40),
                  const _dictionaryWidget(
                      title: 'Турецко-дигорский словарь',
                      description:
                          'Количество статей  20624\nРазмер файла           2,36 МБ\nСостояние                  отключен <e>❌</e>\nОзвучка                      —',
                      author: 'Золойти Алийхсан. Турецко-дигорский словарь.')
                ],
                if (context.locale == const Locale('en', 'US')) ...[
                  const _dictionaryWidget(
                    title: 'Digor-Russian dictionary',
                    description:
                        'Entry count  34657\nFile size         4,00 MB\nState              active <a>✅</a>\nSound            planned',
                    author: 'Takazov F. M. Digor-Russian dictionary. Russian-Digor dictionary. - Vladikavkaz, 2015.',
                  ),
                  const SizedBox(height: 40),
                  const _dictionaryWidget(
                    title: 'Digor-English dictionary',
                    description:
                        'Entry count  18780\nFile size         3,85 MB\nState              active <a>✅</a>\nSound            planned',
                    author:
                        'Vydrin A. P. The Digor-English dictionary prepared for the English version of the Digor language corpus <ref>http://corpus-digor.ossetic-studies.org</ref>',
                  ),
                  const SizedBox(height: 40),
                  const _dictionaryWidget(
                    title: 'Turkish-Digor dictionary',
                    description:
                        'Entry count  20624\nFile size         2,36 MB\nState              inactive <e>❌</e>\nSound            —',
                    author: 'Zoloiti Aliykhsan. Turkish-Digor dictionary.',
                  ),
                ],
                if (context.locale == const Locale('tr', 'TR')) ...[
                  const _dictionaryWidget(
                    title: 'Digorçe-Rusça sözlük',
                    description:
                        'Giriş sayısı               34657\nDosya boyutu         4,00 MB\nDurum                      aktif <a>✅</a>\nSes                             planlandı',
                    author: 'Takazov F. M. Digorçe-Rusça sözlük. Rusça-Digorçe sözlüğü. - Vladikavkaz, 2015.',
                  ),
                  const SizedBox(height: 40),
                  const _dictionaryWidget(
                    title: 'Digorçe-İngilizce sözlük',
                    description:
                        'Giriş sayısı               18780\nDosya boyutu         3,85 MB\nDurum                      aktif <a>✅</a>\nSes                             planlandı',
                    author:
                        'Vydrin A. P. Digor dil külliyatının İngilizce versiyonu için hazırlanan Digorçe-İngilizce sözlük <ref>http://corpus-digor.ossetic-studies.org</ref>',
                  ),
                  const SizedBox(height: 40),
                  const _dictionaryWidget(
                    title: 'Türkçe-Digorçe sözlük',
                    description:
                        'Giriş sayısı               20624\nDosya boyutu         2,36 MB\nDurum etkin           değil <e>❌</e>\nSes                             —',
                    author: 'Zoloiti Aliykhsan. Türkçe-Digorçe sözlüğü.',
                  ),
                ],
                if (context.locale == const Locale('de', 'DE')) ...[
                  const _dictionaryWidget(
                    title: 'Дигорон-уруссаг дзурдуат',
                    description:
                        'Финстуацти нимӕдзӕ  34657\nФайли асӕ                         4,00 MB\nӔууӕл                                 косуй <a>✅</a>\nЗӕлгонд                             уодзӕнӕй',
                    author: 'Тахъазти Федар. Дигорон-уруссаг дзурдуат. Уруссаг-дигорон дзурдуат. - Дзӕуӕгигъӕу, 2015.',
                  ),
                  const SizedBox(height: 40),
                  const _dictionaryWidget(
                    title: 'Дигорон-англисаг дзурдуат',
                    description:
                        'Финстуацти нимӕдзӕ  18780\nФайли асӕ                         3,85 MB\nӔууӕл                                 косуй <a>✅</a>\nЗӕлгонд                             уодзӕнӕй',
                    author:
                        'Выдрин А. П. Дигорон-англисаг дзурдуат цӕттӕгонд ӕрцудӕй дигорон ӕвзагон къорпусӕн англисаг хузӕн <ref>http://corpus-digor.ossetic-studies.org</ref>',
                  ),
                  const SizedBox(height: 40),
                  const _dictionaryWidget(
                    title: 'Турккаг-дигорон дзурдуат',
                    description:
                        'Финстуацти нимӕдзӕ  20624\nФайли асӕ                         2,36 MB\nӔууӕл                                 нӕ косуй <e>❌</e>\nЗӕлгонд                              —',
                    author: 'Золойти Алийхсан. Турккаг-дигорон дзурдуат.',
                  ),
                ]
              ],
            ),
          ),
        ));
  }
}

class _dictionaryWidget extends StatelessWidget {
  final String title;
  final String description;
  final String author;
  const _dictionaryWidget({required this.title, required this.description, required this.author});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.headlineSmall!.copyWith(
            fontSize: 21,
            fontFamily: 'SamsungOne',
          ),
        ),
        const SizedBox(height: 20),
        StyledText(
          text: description,
          style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 16,
              height: 1.3,
              color: theme.textTheme.bodyMedium!.color,
              fontFamily: 'SamsungOne',
              fontWeight: FontWeight.w500),
          tags: {
            'a': StyledTextActionTag((String? text, Map<String?, String?> attrs) {},
                style: const TextStyle(fontSize: 15, color: Colors.green)),
            'e': StyledTextActionTag((String? text, Map<String?, String?> attrs) {},
                style: const TextStyle(fontSize: 12)),
            'ref': StyledTextActionTag(
              (String? text, Map<String?, String?> attrs) {
                _launchUrl(Uri.parse(text!));
              },
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? const Color.fromARGB(255, 0, 129, 255)
                      : const Color.fromARGB(255, 0, 0, 238)),
            ),
          },
        ),
        const SizedBox(height: 7.5),
        StyledText(
          text: author,
          style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 16,
              height: 1.3,
              color: theme.textTheme.bodyMedium!.color,
              fontFamily: 'SamsungOne',
              fontWeight: FontWeight.w500),
          tags: {
            'ref': StyledTextActionTag(
              (String? text, Map<String?, String?> attrs) {
                _launchUrl(Uri.parse(text!));
              },
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? const Color.fromARGB(255, 0, 129, 255)
                      : const Color.fromARGB(255, 0, 0, 238)),
            ),
          },
        )
      ],
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
