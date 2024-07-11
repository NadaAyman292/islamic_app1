import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_image.png"),
        Text(
          "quran_radio".tr(),
          textAlign: TextAlign.center,
          style: GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/Icon_metro-back.png",
              color: Color(0xffB7935F),
            ),
            Icon(
              Icons.play_arrow,
              size: 35,
              color: Color(0xffB7935F),
            ),
            Image.asset(
              "assets/images/Icon_metro-next.png",
              color: Color(0xffB7935F),
            ),
          ],
        )
      ],
    );
  }
}
