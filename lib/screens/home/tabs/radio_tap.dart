import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:islamic_app/utils/theme/colors.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_image.png"),
        Text(
          "quran_radio".tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/Icon_metro-back.png",
              color: provider.mode == ThemeMode.light
                  ? MyColors.primaryColor
                  : MyColors.yellowColor,
            ),
            Icon(
              Icons.play_arrow,
              size: 35,
              color: provider.mode == ThemeMode.light
                  ? MyColors.primaryColor
                  : MyColors.yellowColor,
            ),
            Image.asset(
              "assets/images/Icon_metro-next.png",
              color: provider.mode == ThemeMode.light
                  ? MyColors.primaryColor
                  : MyColors.yellowColor,
            ),
          ],
        )
      ],
    );
  }
}
