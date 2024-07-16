import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/models/sura_model.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:islamic_app/utils/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../sura_details_screen.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});
  List<String> suraNames = [
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

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/quran_bg.png",
          height: 227,
        ),
        const Divider(
          thickness: 3,
        ),
        Text(
          "sura_names".tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Divider(
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: MyColors.primaryColor,
                      ),
                      Expanded(
                        child: Divider(
                          indent: 60,
                          endIndent: 60,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: MyColors.primaryColor,
                      ),
                    ],
                  ),
                );
              },
              itemCount: suraNames.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                        arguments: SuraModel(suraNames[index], index));
                  },
                  child: Text(
                    suraNames[index],
                    textAlign: TextAlign.center,
                    style: provider.mode == ThemeMode.light
                        ? Theme.of(context).textTheme.bodyMedium
                        : Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: MyColors.whiteColor),
                  ),
                );
              }),
        )
      ],
    );
  }
}
