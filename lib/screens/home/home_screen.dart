import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:islamic_app/screens/home/tabs/ahadeth_tab.dart';
import 'package:islamic_app/screens/home/tabs/quran_tab.dart';
import 'package:islamic_app/screens/home/tabs/radio_tap.dart';
import 'package:islamic_app/screens/home/tabs/sebha_tab.dart';
import 'package:islamic_app/screens/home/tabs/setting_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
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
          appBar: AppBar(
              title: Text(
            "islami".tr(),
          )),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) {
                selectedIndex = value;
                isSelected = true;
                setState(() {});
              },
              showSelectedLabels: isSelected ? true : false,
              items: [
                BottomNavigationBarItem(
                    label: selectedIndex == 0 ? "quran".tr() : "",
                    backgroundColor: const Color(0xffB7935F),
                    icon: const ImageIcon(
                      AssetImage(
                        "assets/images/quran.png",
                      ),
                    )),
                BottomNavigationBarItem(
                    label: isSelected ? "tasbeh".tr() : "",
                    icon: const ImageIcon(AssetImage(
                      "assets/images/sebha.png",
                    ))),
                BottomNavigationBarItem(
                    label: isSelected ? "radio".tr() : "",
                    icon: const ImageIcon(AssetImage(
                      "assets/images/radio.png",
                    ))),
                BottomNavigationBarItem(
                    label: isSelected ? "hadiths".tr() : "",
                    icon: const ImageIcon(AssetImage(
                      "assets/images/hadeth.png",
                    ))),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: isSelected ? "settings".tr() : "",
                ),
              ]),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    SettingsTab()
  ];
}
