import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset("assets/images/head_sebha_logo.png"),
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
                  "assets/images/body_sebha_logo.png",
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
            style: GoogleFonts.elMessiri(
                fontSize: 25, fontWeight: FontWeight.w600),
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
                color: Color(0xffB7935F).withOpacity(0.75)),
            child: Text(
              "$counter",
              style:
                  GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w400),
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
                color: Color(0xffB7935F)),
            child: Text(
              tasbeh[index],
              style: GoogleFonts.inter(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
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
