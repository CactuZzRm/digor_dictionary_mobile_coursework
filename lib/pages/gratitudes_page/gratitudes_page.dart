import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

class GratitudesPage extends StatelessWidget {
  const GratitudesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(tr('gratitudes')),
          backgroundColor: theme.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SingleChildScrollView(
            child: StyledText(
              text: context.locale == const Locale('ru', 'RU')
                  ? '''
Данное приложение появилось благодаря поддержке людей, неравнодушных к положению и судьбе дигорского языка.

От имени руководителя проекта хотелось бы выразить огромную благодарность людям, внесшим вклад в создание мобильного приложения:

<b>Алборовой Зарине Александровне</b> - создателю сайта Digoria.com <ref>https://www.digoria.com</ref> за энтузиазм и неугасаемую веру в успех реализации проекта, огромную активность в распространении информации о сборе средств, а также ходе развития проекта.

<b>Таказову Валерию Дзантемировичу</b> - доктору филологических наук, профессору, за большую активность в вопросах государственного статуса дигорского языка, организаций двух научно-практических конференций по проблемам дигорского языка и культуры, на котором также было представлено мобильное приложение дигорско-русско-английского словаря «Digor». За отзывчивость и помощь в различных вопросах.

<b>Таказову Федару Магометовичу</b> - доктору филологических наук, профессору, создателю дигорского-русского и русского дигорского словарей.
 
<b>Дряеву Юрию</b> - за перевод дигорско-русского словаря (2003) в машиночитаемый формат необходимый для электронного словаря.

<b>Кудзаеву Аслану</b> - создателю электронной библиотеки в группе Вконтакте «Bærzæfcæg» <ref>https://vk.com/barzafcag</ref> за сканирование дигорского-русского и русского-дигорского словаря 2003, 2015.

<b>Магомедову Магомеду</b> - создателю приложения мультиязычного словаря северокавказских языков «Bazur» <ref>https://play.google.com/store/apps/details?id=com.alkaitagi.avzag</ref> и «Avdan» <ref>https://play.google.com/store/apps/details?id=com.alkaitagi.avdan</ref> за консультативную помощь при создании проекта.

<b>Макаренко Марии Дмитриевне</b> - за лингвистическую помощь в оформлении структуры словарей.

<b>Дзуцевой Лане</b> - за техническую работу над дигорско-английским и турецко-дигорским словарями.

<b>Золойти Алийхсану</b> - за проделанный огромный труд в составлении турецко-дигорского словаря.

<b>Сотрудникам газеты «Дигора»</b> - за распространение новости о создании мобильного приложения. <ref>https://gazeta-digora.ru/</ref>

Для создания электронного словаря «Digor» был объявлен сбор денежных средств на реализацию поставленных технических и лингвистических задач. 

Отдельная благодарность за поддержку проекта <b>Батразу Хидирову, Вадиму Бердиеву, Дане и Зарине Алборовым, Юрию Дзекоеву, Тавитовой - Кардановой Зое, Марату Сабанову, Голубевой Бэлле, Гетоевой Ларисе, Лауре Юрьевне Г., Алану Хетаговичу Т.</b>

Особенно хотелось бы выделить и поблагодарить всех тех людей, благодаря которым появилось данное приложение:

1 Алборов Барисби 
2 Алборова - Дзотцоева Лариса 
3 Алборова Дана 
4 Алборты Зарина 
5 Аршиева Лора 
6 Байцаев Заурбек 
7 Байцаева Лема 
8 Бердиев Вадим 
9 Бициева Бэлла 
10 Будаев Давид 
11 Будаев Марат 
12 Будаев Эдуард
13 Будайти Мурат  
14 Габеева - Гобаева Оксана 
15 Галкина Светлана 
16 Гаспарян Вардуи 
17 Гегкиева Камила 
18 Гетоев Владимир 
19 Гетоев Руслан 
20 Гетоев Сослан 
21 Гетоева - Гецаева Фатима 
22 Гетоева - Тускаева Эльвира 
23 Гетоева Дзерасса 
24 Гетоева Зарина 
25 Гетоева Лариса 
26 Гетоева Людмила 
27 Гетоева Эльза 
28 Голубева Бэлла 
29 Григоращенко Юрий 
30 Гурдзибеева Ирина 
31 Джусоева Магдалина 
32 Дзагурова Дана 
33 Дзагурова Диана 
34 Дзекоев Юрий 
35 Дзидзоев Георгий 
36 Дзотцоев Борис 
37 Дзотцоева Алана 
38 Дзотцоти Ирина 
39 Елеева Нина 
40 Елканов Заурбек 
41 Елканова - Сабанова Дзерасса 
42 Золоев Валерий 
43 Зураев Ирлан 
44 Кабалоева Джульетта 
45 Кабалоева Фатима 
46 Кадохова Мадина 
47 Каирова Залина 
48 Калухов Артур 
49 Лолаева - Кибизова Зарема 
50 Макоев Таймураз 
51 Малиев Заурбек 
52 Малиева Луиза 
53 Мамаева Марина 
54 Мамиева Вера 
55 Мамиева Разиат 
56 Мамукаев Казбек 
57 Мамукаева Людмила 
58 Миндзаев Игорь 
59 Миндзаев Марат 
60 Миндзаева Валентина 
61 Михайлова - Сабанова Козетта 
62 Сабанов Марат 
63 Сабанов Сергей 
64 Сабанов Тамерлан 
65 Скодтаев Энвер 
66 Сланова - Цаголова Галина 
67 Суменова Бела 
68 Тавасиева Залина 
69 Тавитова - Карданова Зоя 
70 Тайсаев Владимир Сулейманович 
71 Тайсаев Владимир Тазретович 
72 Тайсаев Рамазан 
73 Таказов Валерий 
74 Тандуева Людмила 
75 Тегаева Зарема 
76 Текоев Владимир 
77 Текоева Альбина 
78 Текоева Жанна 
79 Текоева Рима 
80 Томаев Борис 
81 Томаев Феликс 
82 Тубеев Роберт 
83 Тургиев Таймураз 
84 Тускаева Гуара 
85 Уримагова Людмила 
86 Уруймагов Александр 
87 Халлаева Аза 
88 Хидиров Батраз 
89 Хлоева Зарема 
90 Царикаева Рима 
91 Цебоев Артур 
92 Цебоева Ирина 
93 Диана К. 
94 Алихан Асланович Ц. 
95 Азамат Б. 
96 Людмила Германовна Р. 
97 Катерина Маратовна Б. 
98 Мадина Руслановна Б. 
99 Фатима Магометовна К. 
100 Залина Александровна Х. 
101 Фатима Батарбековна С. 
102 Оксана Алихановна Л. 
103 Хетаг Олегович Т. 
104 Артём Александрович Х. 
105 Зарета Сахановна Д. 
106 Константин Юрьевич Д. 
107 Алан Хетагович Т. 
108 Лаура Юрьевна Г. 
109 Эдуард Юрьевич К. 
110 Рустам Магамедович Д. 
111 Бэлла Эльбрусовна К. 
112 Екатерина Александровна Г 
113 Алан Николаевич К. 
114 Елена Александровна Г. 
115 Лида Александровна З.
'''
                  : context.locale == const Locale('en', 'US')
                      ? '''
This application appeared thanks to the support of people who are not indifferent to the status and fate of the Digor language.

On behalf of the project manager, I would like to express my deep gratitude to the people who contributed to the creation of the mobile application:

<b>Alborova Zarina Alexandrovna</b> - the creator of the site Digoria.com <ref>https://www.digoria.com</ref> for her enthusiasm and unquenchable faith in the success of the project, great activity in disseminating information about fundraising, as well as the progress of the project.

<b>Takazov Valery Dzantemirovich</b> - Doctor of Philology, Professor, for his great activity in matters of the state status of the Digor language, the organization of two scientific and practical conferences on the problems of the Digor language and culture, which also presented the mobile application of the Digor-Russian-English dictionary «Digor». For responsiveness and help in various issues.

<b>Takazov Fedar Magometovich</b> - doctor of philological sciences, professor, creator of the Digor-Russian and Russian-Digor dictionaries.
 
<b>Dryaev Yuri</b> - for the translation of the Digor-Russian dictionary (2003) into a machine-readable format necessary for an electronic dictionary.

<b>Kudzaev Aslan</b> - the creator of the electronic library in the Vkontakte group «Bærzæfcæg» <ref>https://vk.com/barzafcag</ref> for scanning the Digor-Russian and Russian-Digor dictionary 2003, 2015.

<b>Magomedov Magomed</b> - the creator of the application of the multilingual dictionary of the North Caucasian languages «Bazur» <ref>https://play.google.com/store/apps/details?id=com.alkaitagi.avzag</ref> and «Avdan» <ref>https://play.google.com/store/apps/details?id=com.alkaitagi.avdan</ref> for consulting assistance in creating the project.

<b>Makarenko Maria Dmitrievna</b> - for linguistic assistance in designing the structure of dictionaries.

<b>Dzutseva Lana</b> - for technical work on the Digor-English and Turkish-Digor dictionaries.

<b>Zoloiti Aliyhsan</b> - for the great work done in compiling the Turkish-Digor dictionary.

To the employees of the Digora newspaper - for spreading the news about the creation of a mobile application. <ref>https://gazeta-digora.ru/</ref>

To create an electronic dictionary «Digor», a fundraiser was announced for the implementation of the technical and linguistic tasks.

Special thanks for supporting the project to <b>Batraz Khidirov, Vadim Berdiev, Dana and Zarina Alborovs, Yuri Dzekoev, Tavitova-Kardanova Zoya, Marat Sabanov, Golubeva Bella, Getoeva Larisa, Laura Yurievna G., Alan Khetagovich T.</b>

I would especially like to highlight and thank all those people who made this application possible:

1 Alborov Barisbi 
2 Alborova - Dzotsoeva Larisa 
3 Alborova Dana 
4 Alborty Zarina 
5 Arshieva Laura 
6 Baitsaev Zaurbek 
7 Baitsaeva Lema 
8 Berdiev Vadim 
9 Bitsieva Bella 
10 Budaev David 
11 Budaev Marat 
12 Budaev Eduard
13 Budaiti Murat  
14 Gabeeva - Gobaeva Oksana 
15 Galkina Svetlana 
16 Gasparyan Varduhi 
17 Gegkieva Kamila 
18 Getoev Vladimir 
19 Getoev Ruslan 
20 Getoev Soslan 
21 Getoeva - Getsaeva Fatima 
22 Getoeva - Tuskaeva Elvira 
23 Getoeva Dzerassa 
24 Getoeva Zarina 
25 Getoeva Larisa 
26 Getoeva Ludmila 
27 Getoeva Elza 
28 Golubeva Bella 
29 Grigorashchenko Yuri 
30 Gurdzibeeva Irina 
31 Dzhusoeva Magdalina 
32 Dzagurova Dana 
33 Dzagurova Diana 
34 Dzekoev Yuri 
35 Dzidzoev Georgy 
36 Dzotsoev Boris 
37 Dzotsoeva Alana 
38 Dzotzoti Irina 
39 Eleeva Nina 
40 Elkanov Zaurbek 
41 Elkanova - Sabanova Dzerassa 
42 Kabaloeva Juliet 
43 Kabaloeva Fatima 
44 Kadokhova Madina 
45 Kairova Zalina 
46 Kalukhov Artur 
47 Lolaeva - Kibizova Zarema 
48 Makoev Taimuraz 
49 Maliev Zaurbek 
50 Malieva Louise 
51 Mamaeva Marina 
52 Mamieva Vera 
53 Mamieva Raziat 
54 Mamukaev Kazbek 
55 Mamukaeva Lyudmila 
56 Mindzaev Igor 
57 Mindzaev Marat 
58 Mindzaeva Valentina 
59 Mikhailova - Sabanova Cosette 
60 Sabanov Marat 
61 Sabanov Sergey 
62 Sabanov Tamerlan 
63 Skodtaev Enver 
64 Slanova - Tsagolova Galina 
65 Sumenova Bela 
66 Tavasieva Zalina 
67 Tavitova - Kardanova Zoya 
68 Taysaev Vladimir Suleimanovich 
69 Taysaev Vladimir Tazretovich 
70 Taysaev Ramazan 
71 Takazov Valery 
72 Tandueva Lyudmila 
73 Tegaeva Zarema 
74 Tekoev Vladimir 
75 Tekoeva Albina 
76 Tekoeva Zhanna 
77 Tekoeva Rima 
78 Tomaev Boris 
79 Tomaev Felix 
80 Tsarikaeva Rima 
81 Tseboev Artur 
82 Tseboeva Irina 
83 Tubeev Robert 
84 Turgiev Taimuraz 
85 Tuskaeva Guara 
86 Urimagova Ludmila 
87 Uruimagov Alexander 
88 Hallaeva Aza 
89 Khidirov Batraz 
90 Khloeva Zarema 
91 Zoloev Valery 
92 Zuraev Irlan 
93 Diana K. 
94 Alikhan Aslanovich Ts. 
95 Azamat B. 
96 Ludmila Germanovna R. 
97 Katerina Maratovna B. 
98 Madina Ruslanovna B. 
99 Fatima Magometovna K. 
100 Zalina Alexandrovna H. 
101 Fatima Batarbekovna S. 
102 Oksana Alikhanovna L. 
103 Khetag Olegovich T. 
104 Artyom Alexandrovich H. 
105 Zareta Sakhanovna D. 
106 Konstantin Yurievich D. 
107 Alan Hetagovich T. 
108 Laura Yurievna G. 
109 Edward Yurievich K. 
110 Rustam Magamedovich D. 
111 Bella Elbrusovna K. 
112 Ekaterina Alexandrovna G 
113 Alan Nikolaevich K. 
114 Elena Alexandrovna G. 
115 Lida Alexandrovna Z.
'''
                      : context.locale == const Locale('tr', 'TR')
                          ? '''
Bu uygulama Digor dilinin durumuna ve kaderine kayıtsız kalmayan kişilerin desteği sayesinde ortaya çıkmıştır.

Proje yöneticisi adına, mobil uygulamanın oluşturulmasına katkıda bulunan kişilere derin şükranlarımı sunmak isterim:

<b>Alborova Zarina Aleksandrovna</b> - Digoria.com <ref>https://www.digoria.com</ref> sitesinin yaratıcısı, coşkusu ve projenin başarısına olan sarsılmaz inancı, bağış toplama ve projenin ilerleyişi hakkında bilgi yaymadaki büyük etkinliği nedeniyle .

<b>Takazov Valery Dzantemirovich</b> - Filoloji Doktoru, Profesör, Digor dilinin devlet statüsü konularındaki büyük faaliyetleri, Digor dili ve kültürü sorunları üzerine iki bilimsel ve pratik konferansın düzenlenmesi ve aynı zamanda mobil uygulamasını da sundu. Digorçe-Rusça-İngilizce Sözlük «Digor». Duyarlılık ve çeşitli konularda yardım için.

<b>Takazov Fedar Magometovich</b> - filoloji bilimleri doktoru, profesör, Digorçe-Rusça ve Rusça-Digorçe sözlüklerinin yaratıcısı.
 
<b>Dryaev Yuri</b> - Digorçe-Rusça sözlüğün (2003) elektronik Sözlük için gerekli olan makine tarafından okunabilir bir biçime çevrilmesi için.

<b>Kudzaev Aslan</b> - Digorçe-Rusça ve Rusça-Digorçe sözlüğünü 2003, 2015 taramak için Vkontakte grubu «Bærzæfcæg» <ref>https://vk.com/barzafcag</ref> 'daki elektronik kütüphanenin yaratıcısı.

<b>Magomedov Magomed</b> - Kuzey Kafkas dillerinin çok dilli sözlüğü «Bazur» <ref>https://play.google.com/store/apps/details?id=com.alkaitagi.avzag</ref> ve «Avdan» <ref>https://play.google.com/store/apps/details?id=com.alkaitagi.avdan</ref> uygulamasının yaratıcısı Proje oluşturma konusunda danışmanlık yardımı için

<b>Makarenko Maria Dmitrievna</b> - sözlüklerin yapısını tasarlamada dilsel yardım için.

<b>Dzutseva Lana</b> - Digorçe-İngilizce ve Türkçe-Digorçe sözlüklerdeki teknik çalışmalar için.

<b>Zoloiti Aliyhsan</b> - Türkçe-Digorçe sözlüğünün derlenmesinde yaptığı büyük iş için.

Digora gazetesinin çalışanlarına - bir mobil uygulamanın oluşturulmasıyla ilgili haberleri yaydıkları için. <ref>https://gazeta-digora.ru/</ref>

Bir elektronik Sözlük «Digor» oluşturmak için, teknik ve dilbilimsel görevlerin uygulanması için bir bağış toplama etkinliği duyuruldu.

<b>Batraz Khidirov, Vadim Berdiev, Dana ve Zarina Alborovlar, Yuri Dzekoyev, Tavitova-Kardanova Zoya, Marat Sabanov, Golubeva Bella, Getoeva Larisa, Laura Yurievna G., Alan Khetagovich T.</b>'ye projeyi destekledikleri için özel teşekkürler.

Bu uygulamayı mümkün kılan herkese özellikle vurgulamak ve teşekkür etmek istiyorum:

1 Alborov Barışbi 
2 Alborova - Dzotsoeva Larisa 
3 Alborova Dana 
4 Alborti Zarina 
5 Arşieva Laura 
6 Baitsaev Zaurbek 
7 Baitsaeva Lema 
8 Berdiyev Vadim 
9 Bitsiyeva Bella 
10 Budayev David 
11 Budayev Marat 
12 Budayev Eduard
13 Budaiti Murat   
14 Gabeeva - Gobaeva Oksana 
15 Galkina Svetlana 
16 Gasparyan Varduhi 
17 Gegkieva Kamila 
18 Getoyev Vladimir 
19 Getoyev Ruslan 
20 Getoyev Soslan 
21 Getoeva - Getsaeva Fatima 
22 Getoeva - Tuskaeva Elvira 
23 Getoeva Dzerassa 
24 Getoeva Zarina 
25 Getoeva Larisa 
26 Getoeva Ludmila 
27 Getoeva Elza 
28 Golubeva Bella 
29 Grigoraşçenko Yuri 
30 Gurdzibeeva Irina 
31 Dzhusoeva Magdalina 
32 Dzagurova Dana 
33 Dzagurova Diana 
34 Dzekoyev Yuri 
35 Dzidzoev Georgy 
36 Dzotsoyev Boris 
37 Dzotsoeva Alana 
38 Dzotzoti Irina 
39 Eleeva Nina 
40 Elkanov Zaurbek 
41 Elkanova - Sabanova Dzerassa 
42 Kabaloeva Juliet 
43 Kabaloeva Fatima 
44 Kadokhova Medine 
45 Kayrova Zalina 
46 Kalukhov Artur 
47 Lolaeva - Kibizova Zarema 
48 Makoev Taimuraz 
49 Maliev Zaurbek 
50 Malieva Louise 
51 Mamaeva Marinası 
52 Mamieva Vera 
53 Mamieva Raziat 
54 Mamukayev Kazbek 
55 Mamukaeva Lyudmila 
56 Mindzayev İgor 
57 Mindzayev Marat 
58 Mindzaeva Valentina 
59 Mikhailova - Sabanova Cosette 
60 Sabanov Marat 
61 Sabanov Sergei 
62 Sabanov Tamerlan 
63 Skodtaev Enver 
64 Slanova - Tsagolova Galina 
65 Sümenova Bela 
66 Tavasieva Zalina 
67 Tavitova - Kardanova Zoya 
68 Taysaev Vladimir Süleymanoviç 
69 Taysaev Vladimir Tazretoviç 
70 Taysayev Ramazan 
71 Takazov Valery 
72 Tandueva Lyudmila 
73 Tegaeva Zarema 
74 Tekoev Vladimir 
75 Tekoeva Albina 
76 Tekoeva Zhanna 
77 Tekoeva Rima 
78 Tomayev Boris 
79 Tomayev Felix 
80 Tsarikaeva Rima 
81 Tseboyev Artur 
82 Tseboyeva Irina 
83 Tubeyev Robert 
84 Turgiev Taimuraz 
85 Tuskaeva Guara 
86 Urimagova Ludmila 
87 Uruimagov İskender 
88 Hallaeva Aza 
89 Hıdırov Batraz 
90 Khloeva Zarema 
91 Zoloev Valery 
92 Zuraev Irlan 
93 Diana K. 
94 Alihan Aslanoviç Ts. 
95 Azamet B. 
96 Ludmila Germanovna R. 
97 Katerina Maratovna B. 
98 Medine Ruslanovna B. 
99 Fatima Magometovna K. 
100 Zalina Aleksandrovna H. 
101 Fatima Batarbekovna S. 
102 Oksana Alikhanovna L. 
103 Hetag Olegovich T. 
104 Artyom Aleksandroviç H. 
105 Zareta Sakhanovna D. 
106 Konstantin Yuryeviç D. 
107 Alan Hetagoviç T. 
108 Laura Yuryevna G. 
109 Edward Yurievich K. 
110 Rustam Magamedovich D. 
111 Bella Elbrusovna K. 
112 Ekaterina Aleksandrovna G 
113 Alan Nikolayeviç K. 
114 Elena Aleksandrovna G. 
115 Lida Aleksandrovna Z.
'''
                          : '''
Ӕнхасӕн «Digor» фӕззиндтӕй ӕнӕвгъау адӕми ӕнхусӕй, дигорон ӕвзаги исонбонбӕл ка тухсуй, уони фӕрци.

Проекти разамонӕги номӕй, мӕн фӕндуй устур арфӕ ракӕнун аци ӕнхасӕнмӕ ӕ хай ка бахаста, уонӕн:

<b>Ӕлборти Зӕринӕн</b> - сайт Digoria.com - и аразӕгӕн <ref>https://www.digoria.com</ref> хъӕбӕр ке фенхус кодта, ӕновудӕй ке архайдта проект парахат кӕнунбӕл, уӕдта цӕмӕй проект кӕронмӕ исӕнхӕст уа. Устур нифс ӕма амалгун адӕймагӕн.

<b>Тахъазти Валерийӕн</b> - филологон наукити доктор, профессорӕн. Дигорон ӕвзаги паддзахадон статусбӕл архайӕгӕн, уӕдта дууӕ ӕнккӕтадӕмон конферецитӕ дигорон ӕвзаги туххӕй исаразӕгӕн. Е ’ргом ке ӕздахта алли зинкӕнуйнаг фарстатӕмӕ.

<b>Тахъазти Федарӕн</b> - филологон наукити доктор, профессорӕн. Дигорон-уруссаг, уруссаг-дигорон дзурдуӕтти аразӕгӕн.
 
<b>Дриати Юрийӕн</b> - дигорон-уруссаг дзурдуат (2003) фиццагӕй электрон хузӕмӕ ке раййивта.

<b>Кудзати Асланӕн</b> - электрон киунугӕдонӕ «Bærzæfcæg» - и аразӕгӕн <ref>https://vk.com/barzafcag</ref> дигорон-уруссаг, уруссаг-дигорон дзурдуӕттӕ ке рапарахат кодта социалон хизӕгти.

<b>Магомедову Магомеду</b> - Цӕгат Кавкази адӕмти ӕвзӕгутӕн электрон дзурдуат «Bazur» <ref>https://play.google.com/store/apps/details?id=com.alkaitagi.avzag</ref> ӕма «Avdan» <ref>https://play.google.com/store/apps/details?id=com.alkaitagi.avdan</ref> аразӕгӕн, ке амудта зин фарстати ӕнхасӕн куд аразгӕ ’й, е.

<b>Макаренко Марии Дмитриевне</b> - лингвистикон ӕнхус дзурдуӕтти арӕзтӕн.

<b>Дзуццати Ланӕн</b> - дигорон-англисаг уӕдта турккаг-дигорон дзурдуӕттӕбӕл техникон ӕгъдӕуӕй ке байархайдта.

<b>Золойти Алийхсанӕн</b> - устур куст турккаг-дигорон дзурдуат ке исаразта, уой туххӕй.

<b>Газзет «Дигори» косгутӕн</b> - ке ниммухур кодтонцӕ уац дзурдуати туххӕй. <ref>https://gazeta-digora.ru/</ref>

Цӕмӕй электрон дзурдуат «Digor» фӕззиндтайдӕ, уомӕн арӕзт ӕрцудӕй ӕхцай фӕрӕзнити ӕмбурд.

Хецӕн боз зӕгъӕн проекти ӕнхусгӕнгутӕн <b>Хидирти Батразӕн, Бердити Вадимӕн, Ӕлборти Данӕн ӕма Зӕринӕн, Дзекоти Юрийӕн, Тауитти - Хъарданти Зойӕн, Сӕбанти Маратӕн, Голубевой Бэлле, Гетъоти Ларисӕн, Лауре Юрьевне Г., Алану Хетаговичу Т.</b>

Уӕлдайдӕр мах фӕндуй райарфӕ кӕнун еци адӕмӕн, ке фӕрци мах бон иссӕй ӕнхасӕн исаразун, етӕ ӕнцӕ:

1	Ӕлборти Барисби
2	Ӕлборти - Дзотцоти Ларисӕ
3	Ӕлборти Данӕ
4	Ӕлборти Зӕринӕ
5	Ӕрсити Лорӕ
6	Байцати Заурбек
7	Байцати Лемӕ
8	Бердити Вадим
9	Бицъити Бэлла
10	Будайти Давид
11	Будайти Марат
12	Будайти Эдуард
13	Будайти Мурат
14	Габети - Гобати Оксанӕ
15	Галкина Светланӕ
16	Гаспарян Вардуи
17	Гегкити Камилӕ
18	Гетъоти Владимир
19	Гетъоти Руслан
20	Гетъоти Сослан
21	Гетъоти - Гецати Фатимӕ
22	Гетъоти - Тускъати Эльвирӕ
23	Гетъоти Дзерассӕ
24	Гетъоти Зӕринӕ
25	Гетъоти Ларисӕ
26	Гетъоти Людмилӕ
27	Гетъоти Эльзӕ
28	Голубева Бэллӕ
29	Григоращенко Юрий
30	Гурдзибети Иринӕ
31	Джусойти Магдалинӕ
32	Дзагурти Данӕ
33	Дзагурти Дианӕ
34	Дзекоти Юрий               
35	Дзидзойти Георгий
36	Дзотцоти Барис
37	Дзотцоти Аланӕ
38	Дзотцоти Иринӕ
39	Елети Нинӕ
40	Елхъанти Заурбек
41	Елхъанти - Сӕбанти Дзерассӕ
42	Золойти Валерий
43	Зурати Ирлан
44	Хъабалоти Джульеттӕ
45	Хъабалоти Фатимӕ
46	Хъадохти Мадинӕ
47	Хъаирти Зӕлинӕ
48	Кӕлухти Артур
49	Лолати - Къибизти Заремӕ
50	Махъоти Таймураз
51	Малити Заурбек
52	Малити Луизӕ
53	Мамайти Маринӕ
54	Мамити Верӕ
55	Мамити Разиат
56	Мамукъати Къазбек
57	Мамукъати Людмилӕ
58	Миндзайти Игорь
59	Миндзайти Марат
60	Миндзайти Валентинӕ
61	Михайлова - Сӕбӕнти Козеттӕ
62	Сӕбӕнти Марат
63	Сӕбӕнти Сергей
64	Сӕбӕнти Тамерлан
65	Скъодтати Энвер 
66	Сланти - Цӕголти Галинӕ
67	Сументи Белӕ
68	Тауасити Зӕлинӕ
69	Тауитти - Хъарданти Зоя
70	Тайсаути Владимир Сулеймани фурт
71	Тайсаути Владимир Тазарети фурт
72	Тайсаути Рамазан
73	Тахъазти Валерий
74	Тандути Людмилӕ
75	Тегати Заремӕ
76	Текъойти Владимир
77	Текъойти Альбинӕ
78	Текъойти Жаннӕ
79	Текъойти Римӕ
80	Томайти Барис
81	Томайти Феликс
82	Тубети Роберт
83	Тургити Таймураз
84	Тускъати Гуарӕ
85	Уримӕгти Людмилӕ
86	Уруймӕгти Александр
87	Хӕллати Азӕ
88	Хидирти Батраз
89	Хлойти Заремӕ
90	Царикъати Римӕ
91	Цъебойти Артур
92	Цъебойти Иринӕ
93	Диана К. 
94	Алихан Асланович Ц. 
95	Азамат Б. 
96	Людмила Германовна Р. 
97	Катерина Маратовна Б. 
98	Мадина Руслановна Б. 
99	Фатима Магометовна К. 
100	Залина Александровна Х. 
101	Фатима Батарбековна С. 
102	Оксана Алихановна Л. 
103	Хетаг Олегович Т. 
104	Артём Александрович Х. 
105	Зарета Сахановна Д. 
106	Константин Юрьевич Д. 
107	Алан Хетагович Т. 
108	Лаура Юрьевна Г. 
109	Эдуард Юрьевич К. 
110	Рустам Магамедович Д. 
111	Бэлла Эльбрусовна К. 
112	Екатерина Александровна Г 
113	Алан Николаевич К. 
114	Елена Александровна Г. 
115	Лида Александровна З.
''',
              // textAlign: TextAlign.justify,
              style: theme.textTheme.headlineSmall!.copyWith(
                fontSize: 14,
                fontFamily: 'SamsungOnes',
              ),
              tags: {
                'b': StyledTextActionTag(
                  (String? text, Map<String?, String?> attrs) {},
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
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
          ),
        ));
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
