import 'package:flutter/material.dart';
import 'package:islamic_app/models/sura_model.dart';
import 'package:islamic_app/providers/sura_details_provider.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:islamic_app/utils/theme/colors.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = "suraDetails";
  SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    // if (provider.verses.isEmpty) {
    //   provider.loadSuraFiles(model.index);
    // }
    return ChangeNotifierProvider(
        create: (context) => SuraDetailsProvider()..loadSuraFiles(model.index),
        builder: (context, child) {
          var provider = Provider.of<SuraDetailsProvider>(context);

          return Stack(
            children: [
              Image.asset(
                Provider.of<ThemeProvider>(context).mode == ThemeMode.light
                    ? "assets/images/main_bg.png"
                    : "assets/images/main_dark_bg.png",
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Scaffold(
                appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Provider.of<ThemeProvider>(context).mode ==
                                ThemeMode.light
                            ? MyColors.blackColor
                            : MyColors.whiteColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    title: Text(
                      model.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 30),
                    )),
                body: Card(
                  elevation: 4,
                  color: Provider.of<ThemeProvider>(context).mode ==
                          ThemeMode.light
                      ? Color.fromARGB(255, 196, 179, 155).withOpacity(0.6)
                      : MyColors.primaryDarkColor.withOpacity(0.6),
                  margin: EdgeInsets.all(16),
                  child: ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: provider.verses.length,
                      itemBuilder: (context, index) {
                        return Text(
                          provider.verses[index],
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        );
                      }),
                ),
              ),
            ],
          );
        });
  }
}
