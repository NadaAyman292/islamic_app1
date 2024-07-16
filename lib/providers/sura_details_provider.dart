import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  List<String> verses = [];
  loadSuraFiles(int index) async {
    String file =
        await rootBundle.loadString("assets/files/quran/${index + 1}.txt");
    List<String> suraLines = file.split("\n");
    verses = suraLines;
    notifyListeners();
  }
}
