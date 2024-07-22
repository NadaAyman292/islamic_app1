import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/utils/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double angle = 0;

  List<String> tasbeh = [
    "سبحان الله ",
    "الحمدلله",
    "لا اله الا الله ",
    "الله اكبر ",
  ];

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
              Provider.of<ThemeProvider>(context).mode == ThemeMode.light
                  ? "assets/images/head_sebha_logo.png"
                  : "assets/images/head_sebha_dark.png"),
          Center(
            heightFactor: 0.7,
            child: Transform.rotate(
              angle: angle,
              child: GestureDetector(
                onTap: () {
                  // setState(() {});
                  // add();
                  onTap();
                },
                child: Image.asset(
                  Provider.of<ThemeProvider>(context).mode == ThemeMode.light
                      ? "assets/images/body_sebha_logo.png"
                      : "assets/images/body_sebha_dark.png",
                  height: 234,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            "number_of_praises".tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: 69,
            height: 81,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color:
                    Provider.of<ThemeProvider>(context).mode == ThemeMode.light
                        ? MyColors.primaryColor.withOpacity(0.5)
                        : MyColors.primaryDarkColor.withOpacity(0.5)),
            child: Text(
              "$counter",
              style: Provider.of<ThemeProvider>(context).mode == ThemeMode.light
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: 137,
            height: 51,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Provider.of<ThemeProvider>(context).mode == ThemeMode.light
                  ? MyColors.primaryColor
                  : MyColors.yellowColor,
            ),
            child: Text(
              tasbeh[index],
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  onTap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
      counter++;
      counter = 0;
    }
    if (index == tasbeh.length) {
      index = 0;
    }
    angle += 360 / 4;
    setState(() {});
  }
}
