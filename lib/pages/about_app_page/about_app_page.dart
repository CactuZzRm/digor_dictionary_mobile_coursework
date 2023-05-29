import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({super.key});

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  String appVersion = '1.0.0';

  Future<void> checkVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
    });
  }

  @override
  void initState() {
    super.initState();
    checkVersion();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('about_app')),
        backgroundColor: theme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (context.locale == const Locale('ru', 'RU')) ...[
              Text(
                'Словари Digor®',
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontSize: 21,
                  fontFamily: 'SamsungOne',
                ),
              ),
              Text(
                '''

Версия $appVersion

Артикул 1777/25.

© 2023 АНО СКИКИ.
Автор и руководитель проекта Будайти Мурат Олегович

Проект «Digor» предназначен для всех, кто интересуется дигорским языком - как родным или как иностранным, для учащихся средней и высшей школы, а также для специалистов, профессионально занимающихся лингвистикой или преподаванием дигорского языка и литературы. Приложение содержит общедоступную лингвистическую информацию разного типа.
''',
                textAlign: TextAlign.justify,
                style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    height: 1.3,
                    color: theme.textTheme.bodyMedium!.color,
                    fontFamily: 'SamsungOne',
                    fontWeight: FontWeight.w500),
              ),
            ],
            if (context.locale == const Locale('en', 'US')) ...[
              Text(
                'Digor® Dictionaries',
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontSize: 21,
                  fontFamily: 'SamsungOne',
                ),
              ),
              Text(
                '''

Version $appVersion

Part# 1777/25.

© 2023 ANO SKIKI.

Author and project manager Murat Budaiti

The «Digor» project is intended for everyone who is interested in the Digor language - as a native language or as a foreign language, for students of secondary and higher schools, as well as for specialists professionally engaged in linguistics or teaching the Digor language and literature. The application contains various types of publicly available linguistic information.
''',
                textAlign: TextAlign.justify,
                style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    height: 1.3,
                    color: theme.textTheme.bodyMedium!.color,
                    fontFamily: 'SamsungOne',
                    fontWeight: FontWeight.w500),
              ),
            ],
            if (context.locale == const Locale('tr', 'TR')) ...[
              Text(
                'Digor® Sözlükleri',
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontSize: 21,
                  fontFamily: 'SamsungOne',
                ),
              ),
              Text(
                '''

Sürüm $appVersion

Parça No. 1777/25.

© 2023 ANO SKIKI.
Yazar ve proje yöneticisi Murat Budaiti

«Digor» projesi, Digor diliyle ana dil veya yabancı dil olarak ilgilenen herkes, orta ve yüksek okul öğrencileri ve ayrıca dilbilim veya Digor dilini öğreten profesyonel olarak çalışan uzmanlar için tasarlanmıştır. edebiyat. Uygulama, halka açık çeşitli dil bilgisi türlerini içerir.
''',
                textAlign: TextAlign.justify,
                style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    height: 1.3,
                    color: theme.textTheme.bodyMedium!.color,
                    fontFamily: 'SamsungOne',
                    fontWeight: FontWeight.w500),
              ),
            ],
            if (context.locale == const Locale('de', 'DE')) ...[
              Text(
                'Дзурдуӕттӕ Digor®',
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontSize: 21,
                  fontFamily: 'SamsungOne',
                ),
              ),
              Text(
                '''

Хузӕ $appVersion

Артикул 1777/25.

© 2023 АНО ЦКИКИ.
Проекти автор ӕма разамонӕг Будайти Мурат 

Проект «Digor» арӕзт ӕй, дигорон ӕвзаг цӕмӕдесаг кӕмӕн ӕй, уонӕй алке туххӕн дӕр – ӕвзаг ин хеуон уа, ӕви фӕсарӕйнаг, уӕдта астӕуккаг ӕма уӕлдӕр ахургӕнӕндӕнтти ахурдзаутӕн, никки ба ма, лингвистикӕ ӕ професси кӕмӕн ӕй, кенӕ дигорон ӕвзаг ӕма литератури ахургӕнӕг ка ӕй, уонӕн. Аци уӕлӕнхасӕни бакӕсӕн ес аллихузи лингвистикон информаци.
''',
                textAlign: TextAlign.justify,
                style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    height: 1.3,
                    color: theme.textTheme.bodyMedium!.color,
                    fontFamily: 'SamsungOne',
                    fontWeight: FontWeight.w500),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
