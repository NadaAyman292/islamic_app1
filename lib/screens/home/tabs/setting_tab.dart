import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/widgets/custom_text_setting.dart';

import '../../../helper/cache_helper.dart';
import '../../../widgets/modal_bottom_sheet_item.dart';
import '../../../widgets/setting_item.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedLanguage = "english".tr();
  String themeSelected = "light_theme".tr();
  bool isLight = true;
  @override
  void initState() {
    super.initState();
    CacheData.cachIntialization();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextSetting(
          text: "language".tr(),
        ),
        InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(18),
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color(0xffB7935F),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                      child: Column(
                        children: [
                          ModalBottomSheetItem(
                              icon: selectedLanguage == "arabic".tr()
                                  ? Icons.check
                                  : null,
                              borderColor: selectedLanguage == "arabic".tr()
                                  ? Colors.brown
                                  : Color.fromARGB(255, 192, 168, 133),
                              onTap: () {
                                setState(() {
                                  selectedLanguage = "arabic".tr();
                                  context.setLocale(const Locale('ar'));
                                });
                                Navigator.pop(context);
                              },
                              text: "arabic".tr()),
                          const SizedBox(
                            height: 20,
                          ),
                          ModalBottomSheetItem(
                            icon: selectedLanguage == "english".tr()
                                ? Icons.check
                                : null,
                            borderColor: selectedLanguage == "english".tr()
                                ? Colors.brown
                                : Color.fromARGB(255, 192, 168, 133),
                            onTap: () {
                              setState(() {
                                selectedLanguage = "english".tr();
                                context.setLocale(Locale('en'));
                              });
                              Navigator.pop(context);
                            },
                            text: "english".tr(),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: SettingItem(
              text: selectedLanguage,
            )),
        CustomTextSetting(
          text: "theme".tr(),
        ),
        InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(18),
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color(0xffB7935F),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                      child: Column(
                        children: [
                          ModalBottomSheetItem(
                            text: "dark_theme".tr(),
                            icon: themeSelected == "dark_theme".tr()
                                ? Icons.check
                                : null,
                            borderColor: themeSelected == "dark_theme"
                                ? Colors.brown
                                : Color.fromARGB(255, 192, 168, 133),
                            onTap: () {
                              setState(() {
                                themeSelected = "dark_theme".tr();
                              });
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ModalBottomSheetItem(
                            icon: themeSelected == "light_theme"
                                ? Icons.check
                                : null,
                            borderColor: themeSelected == "light_theme"
                                ? Colors.brown
                                : Color.fromARGB(255, 192, 168, 133),
                            onTap: () {
                              setState(() {
                                themeSelected = "light_theme";
                              });
                              Navigator.pop(context);
                            },
                            text: "light_theme".tr(),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: SettingItem(
              text: themeSelected,
            )),
      ],
    );
  }
}
