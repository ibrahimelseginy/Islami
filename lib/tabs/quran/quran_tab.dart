import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_testing/app_theme.dart';
import 'package:islami_testing/generated/l10n.dart';
import 'package:islami_testing/models/sura_model.dart';
import 'package:islami_testing/screens/sura_details_screen.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  List<int> nums = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    nums.isEmpty ? loadFile() : null;

    return Stack(children: [
      Column(children: [
        Image.asset(
          'assets/images/qur2an_screen_logo.png',
          height: height * .3,
        ),
        const Divider(
          height: 2,
          thickness: 2,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: width / 2,
            alignment: Alignment.center,
            child: Text(
              S.of(context).ayat_count,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Container(
            width: width / 2,
            alignment: Alignment.center,
            child: Text(
              S.of(context).sura,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ]),
        const Padding(
          padding: EdgeInsets.only(bottom: 7),
          child: Divider(
            height: 2,
            thickness: 2,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: width / 2,
                          child: nums.length != suraName.length
                              ? const SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(nums[index].toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 20,
                                      ))),
                      Container(
                          alignment: Alignment.center,
                          width: width / 2,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                SuraDetailsScreen.routeName,
                                arguments: SuraDetailsArgs(
                                  index,
                                  suraName[index],
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Text(
                                textAlign: TextAlign.center,
                                suraName[index],
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ))
                    ])),
            itemCount: suraName.length,
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Divider(
                thickness: 2,
                height: 2,
              ),
            ),
          ),
        ),
      ]),
      Container(
          alignment: Alignment.bottomCenter,
          height: height,
          child: VerticalDivider(
            indent: height * .3,
            width: 0,
            thickness: 2,
            color: Theme.of(context).brightness == Brightness.light
                ? AppTheme.primaryLight
                : AppTheme.gold,
          )),
    ]);
  }

  Future<void> loadFile() async {
    for (int i = 0; i < suraName.length; i++) {
      String sura = await rootBundle.loadString('assets/files/${i + 1}.txt');
      sura = sura.split('\n').where((s) => s.trim().isNotEmpty).join('\n');
      var lineCount = sura.split('\n');
      nums.add(lineCount.length);
    }

    setState(() {});
  }
}
