import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../models/ahadeth_model.dart';
import '../utils/theme/colors.dart';

class AhadethDetailsScreen extends StatefulWidget {
  static const String routeName = "ahadethDetailsScreen";
  const AhadethDetailsScreen({super.key});

  @override
  State<AhadethDetailsScreen> createState() => _AhadethDetailsScreenState();
}

class _AhadethDetailsScreenState extends State<AhadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as AhadethModel;
    var provider = Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.mode == ThemeMode.light
              ? "assets/images/main_bg.png"
              : "assets/images/main_dark_bg.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color:
                    Provider.of<ThemeProvider>(context).mode == ThemeMode.light
                        ? MyColors.blackColor
                        : MyColors.whiteColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              model.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 30),
            ),
          ),
          body: Card(
            elevation: 4,
            color: Provider.of<ThemeProvider>(context).mode == ThemeMode.light
                ? const Color.fromARGB(255, 196, 179, 155).withOpacity(0.6)
                : MyColors.primaryDarkColor.withOpacity(0.6),
            margin: EdgeInsets.all(16),
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: model.content.length,
                itemBuilder: (context, index) {
                  return Text(
                    model.content[index],
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 20),
                  );
                }),
          ),
        )
      ],
    );
  }
}
