import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/providers/ahadeth_provider.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:islamic_app/utils/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../ahadeth_details.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  // List<AhadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    // if (allAhadeth.isEmpty) {
    //   loadAhadethFile();
    // }
    return ChangeNotifierProvider(
      create: (context) => AhadethProvider()..loadAhadethFile(),
      builder: (context, child) {
        var provider = Provider.of<AhadethProvider>(context);

        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/hadeth_logo.png",
                height: 219,
              ),
              const Divider(
                thickness: 3,
              ),
              Text(
                "hadiths".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Divider(
                thickness: 3,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: provider.allAhadeth.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AhadethDetailsScreen.routeName,
                              arguments: provider.allAhadeth[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            provider.allAhadeth[index].title,
                            textAlign: TextAlign.center,
                            style: Provider.of<ThemeProvider>(context).mode ==
                                    ThemeMode.light
                                ? Theme.of(context).textTheme.bodyMedium
                                : Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: MyColors.whiteColor),
                          ),
                        ),
                      );
                    }),
              )
            ]);
      },
    );
  }

  // loadAhadethFile() {
  //   rootBundle.loadString("assets/files/ahadeth.txt").then((value) {
  //     List<String> ahadeth = value.split("#");

  //     for (int i = 0; i < ahadeth.length; i++) {
  //       String hadethOne = ahadeth[i];
  //       List<String> hadethLines = hadethOne.trim().split("\n");
  //       String title = hadethLines[0];

  //       hadethLines.removeAt(0);

  //       List<String> content = hadethLines;

  //       AhadethModel ahadethModel = AhadethModel(title, content);
  //       allAhadeth.add(ahadethModel);
  //     }
  //     setState(() {});
  //   });
  // }
}
// 