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
        "AL Ahadeth",
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
                      arguments: AhadethModel("Hadeth Number $index+1", index));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Hadeth Number ${index + 1}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ),
              );
            }),
      )
    ]);
  }
}
