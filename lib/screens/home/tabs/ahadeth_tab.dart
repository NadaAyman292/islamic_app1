import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/models/ahadeth_model.dart';

import '../../ahadeth_details.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<AhadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadAhadethFile();
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Image.asset(
        "assets/images/hadeth_logo.png",
        height: 219,
      ),
      const Divider(
        thickness: 3,
        color: Color(0xffB7935F),
      ),
      Text(
        "hadiths".tr(),
        textAlign: TextAlign.center,
        style: GoogleFonts.elMessiri(fontSize: 25, fontWeight: FontWeight.w600),
      ),
      const Divider(
        thickness: 3,
        color: Color(0xffB7935F),
      ),
      Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: allAhadeth.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AhadethDetailsScreen.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Text(
                  allAhadeth[index].title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
              );
            }),
      )
    ]);
  }

  loadAhadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((value) {
      List<String> ahadeth = value.split("#");

      for (int i = 0; i < ahadeth.length; i++) {
        String hadethOne = ahadeth[i];
        List<String> hadethLines = hadethOne.trim().split("\n");
        String title = hadethLines[0];

        hadethLines.removeAt(0);

        List<String> content = hadethLines;

        AhadethModel ahadethModel = AhadethModel(title, content);
        allAhadeth.add(ahadethModel);
      }
      setState(() {});
    });
  }
}
// 