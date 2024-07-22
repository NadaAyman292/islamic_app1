import 'package:flutter/material.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:islamic_app/utils/theme/colors.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
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
                  Text("Light", style: Theme.of(context).textTheme.bodyMedium),
                  Icon(
                    Icons.done,
                    color: provider.mode == ThemeMode.light
                        ? MyColors.blackColor
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: provider.mode == ThemeMode.dark
                    ? Border.all(
                        width: 2,
                        color: provider.mode == ThemeMode.dark
                            ? MyColors.yellowColor
                            : Colors.transparent)
                    : Border.all(color: Colors.transparent),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark", style: Theme.of(context).textTheme.bodyMedium),
                  Icon(
                    Icons.done,
                    color: provider.mode == ThemeMode.dark
                        ? MyColors.yellowColor
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
