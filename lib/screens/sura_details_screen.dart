import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "suraDetails";
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  List<String> verses = [];
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
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
              centerTitle: true,
              title: Text(
                model.name,
                style: GoogleFonts.elMessiri(
                    fontSize: 30, fontWeight: FontWeight.w700),
              )),
          body: Card(
            elevation: 4,
            color: Color(0xffF8F8F8).withOpacity(0.6),
            margin: EdgeInsets.all(16),
            child: ListView.builder(
                itemCount: verses.length,
                itemBuilder: (context, index) {
                  return Text(
                    "$verses[index]",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inder(
                        fontWeight: FontWeight.w400, fontSize: 20),
                  );
                }),
          ),
        ),
      ],
    );
  }

  loadSuraFiles(int index) async {
    String file =
        await rootBundle.loadString("assets/files/quran/${index + 1}.txt");
    List<String> suraLines = file.split("\n");
    verses = suraLines;
    setState(() {});
  }
}
