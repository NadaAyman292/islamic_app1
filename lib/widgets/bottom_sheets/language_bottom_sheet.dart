import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/utils/theme/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class LanguageBottomShett extends StatelessWidget {
  const LanguageBottomShett({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              context.setLocale(Locale("ar"));
              Navigator.pop(context);
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
                              ? context.locale == Locale("ar")
                                  ? MyColors.blackColor
                                  : MyColors.primaryColor
                              : context.locale == Locale("ar")
                                  ? MyColors.yellowColor
                                  : MyColors.primaryDarkColor)
                      : Border.all(
                          color: context.locale == Locale("ar")
                              ? MyColors.yellowColor
                              : Colors.transparent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("arabic".tr(),
                      style: Theme.of(context).textTheme.bodyMedium),
                  Icon(Icons.done,
                      color: provider.mode == ThemeMode.light
                          ? context.locale == Locale("ar")
                              ? MyColors.blackColor
                              : MyColors.primaryColor
                          : context.locale == Locale("ar")
                              ? MyColors.yellowColor
                              : MyColors.primaryDarkColor),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              context.setLocale(Locale("en"));
              Navigator.pop(context);
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
                            ? context.locale == Locale("en")
                                ? MyColors.blackColor
                                : MyColors.primaryColor
                            : context.locale == Locale("en")
                                ? MyColors.yellowColor
                                : MyColors.primaryDarkColor)
                    : Border.all(
                        color: context.locale == Locale("en")
                            ? MyColors.yellowColor
                            : Colors.transparent),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("english".tr()),
                  Icon(Icons.done,
                      color: provider.mode == ThemeMode.light
                          ? context.locale == Locale("en")
                              ? MyColors.blackColor
                              : MyColors.primaryColor
                          : context.locale == Locale("en")
                              ? MyColors.yellowColor
                              : MyColors.primaryDarkColor)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
