import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/models/ahadeth_model.dart';

import '../../ahadeth_details.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Image.asset("assets/images/hadeth_logo.png"),
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
        child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AhadethDetailsScreen.routeName,
                      arguments:
                          AhadethModel("hadith_number  $index+1", index));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: " ${index + 1}",
                            style: GoogleFonts.inter(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                        text: "hadith_number".tr(),
                        style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      )
    ]);
  }
}
