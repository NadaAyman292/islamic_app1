import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/ahadeth_model.dart';

class AhadethDetailsScreen extends StatefulWidget {
  static const String routeName = "ahadethDetailsScreen";
  const AhadethDetailsScreen({super.key});

  @override
  State<AhadethDetailsScreen> createState() => _AhadethDetailsScreenState();
}

class _AhadethDetailsScreenState extends State<AhadethDetailsScreen> {
  @override
  List<String> ahadeth = [];

  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as AhadethModel;

    if (ahadeth.isEmpty) {
      loadSuraFiles(model.index);
    }

    return Stack(
      children: [
        Image.asset(
          "assets/images/main_bg.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Card(
            elevation: 4,
            color: Color(0xffF8F8F8).withOpacity(0.6),
            margin: EdgeInsets.all(16),
            child: ListView.builder(
                itemCount: ahadeth.length,
                itemBuilder: (context, index) {
                  return Text(
                    "${ahadeth[index]}",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inder(
                        fontWeight: FontWeight.w400, fontSize: 20),
                  );
                }),
          ),
        )
      ],
    );
  }

  loadSuraFiles(int index) async {
    String file =
        await rootBundle.loadString("assets/files/ahadeth/h${index + 1}.txt");
    List<String> ahadethLine = file.split("\n");

    ahadeth = ahadethLine;
    setState(() {});
  }
}
