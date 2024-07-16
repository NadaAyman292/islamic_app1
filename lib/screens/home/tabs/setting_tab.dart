import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:islamic_app/utils/theme/colors.dart';
import 'package:islamic_app/widgets/bottom_sheets/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../widgets/bottom_sheets/theme_bottom_sheet.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "theme".tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const ThemeBottomSheet();
                  });
            },
            child: Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: MyColors.primaryColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.mode == ThemeMode.light ? "Light" : "Dark",
                    style: provider.mode == ThemeMode.light
                        ? Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 20)
                        : Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 20, color: MyColors.whiteColor),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: MyColors.primaryColor,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 44,
          ),
          Text(
            "language".tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return LanguageBottomShett();
                  });
            },
            child: Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: MyColors.primaryColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "English",
                    style: provider.mode == ThemeMode.light
                        ? Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 20)
                        : Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 20, color: MyColors.whiteColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: MyColors.primaryColor,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
