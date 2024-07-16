import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/ahadeth_model.dart';

class AhadethProvider extends ChangeNotifier {
  List<AhadethModel> allAhadeth = [];

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
      notifyListeners();
    });
  }
}
