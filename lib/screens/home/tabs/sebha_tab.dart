import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 1;
  int index = 0;

  List<String> tasbeh = [
    "سبحان الله ",
    "الحمدلله",
    "لا اله الا الله ",
    "الله اكبر ",
  ];

  void add() {
    counter++;
    if (counter == 34) {
      counter = 1;
      index++;
      if (index == 4) {
        index = 0;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/head_sebha_logo.png"),
        Center(
          heightFactor: 0.81,
          child: GestureDetector(
            onTap: () {
              add();
            },
            child: Transform.rotate(
              angle: counter * 3,
              transformHitTests: true,
              child: Image.asset(
                "assets/images/body_sebha_logo.png",
                height: 234,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          "Number of tasbeh",
          style:
              GoogleFonts.elMessiri(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 30,
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
            style: GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 15,
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
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        )
      ],
    );
  }
}
