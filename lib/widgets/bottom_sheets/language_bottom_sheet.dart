import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/utils/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class LanguageBottomShett extends StatefulWidget {
  const LanguageBottomShett({super.key});

  @override
  State<LanguageBottomShett> createState() => _LanguageBottomShettState();
}

class _LanguageBottomShettState extends State<LanguageBottomShett> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              //langProvider.changeLanguage(Locale("ar"));
              context.setLocale(Locale("ar"));
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: provider.mode == ThemeMode.light
                      ? Border.all(
                          width: 2,
                          color: provider.mode == ThemeMode.light
                              ? MyColors.blackColor
                              : MyColors.yellowColor)
                      : Border.all(color: Colors.transparent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Arabic", style: Theme.of(context).textTheme.bodyMedium),
                  Icon(Icons.done,
                      color: provider.mode == ThemeMode.light
                          ? MyColors.blackColor
                          : Colors.transparent),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              // langProvider.changeLanguage(Locale("en"));
              context.setLocale(Locale("en"));
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: provider.mode == ThemeMode.light
                    ? Border.all(
                        width: 2,
                        color: provider.mode == ThemeMode.light
                            ? MyColors.blackColor
                            : MyColors.yellowColor)
                    : Border.all(color: Colors.transparent),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("English"),
                  Icon(Icons.done,
                      color: provider.mode == ThemeMode.light
                          ? MyColors.blackColor
                          : Colors.transparent)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
