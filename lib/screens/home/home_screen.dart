import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/screens/home/tabs/ahadeth_tab.dart';
import 'package:islamic_app/screens/home/tabs/quran_tab.dart';
import 'package:islamic_app/screens/home/tabs/radio_tap.dart';
import 'package:islamic_app/screens/home/tabs/sebha_tab.dart';
import 'package:islamic_app/screens/home/tabs/setting_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/main_bg.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                "Islami",
                style: GoogleFonts.elMessiri(
                    fontSize: 30, fontWeight: FontWeight.w700),
              )),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) {
                selectedIndex = value;
                isSelected = true;
                setState(() {});
              },
              backgroundColor: const Color(0xffB7935F),
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              showUnselectedLabels: false,
              showSelectedLabels: isSelected ? true : false,
              items: [
                BottomNavigationBarItem(
                    label: selectedIndex == 0 ? "Quran" : "",
                    backgroundColor: const Color(0xffB7935F),
                    icon: const ImageIcon(
                      AssetImage(
                        "assets/images/quran.png",
                      ),
                    )),
                BottomNavigationBarItem(
                    backgroundColor: const Color(0xffB7935F),
                    label: isSelected ? "Tasbeh" : "",
                    icon: const ImageIcon(AssetImage(
                      "assets/images/sebha.png",
                    ))),
                BottomNavigationBarItem(
                    backgroundColor: const Color(0xffB7935F),
                    label: isSelected ? "Radio" : "",
                    icon: const ImageIcon(AssetImage(
                      "assets/images/radio.png",
                    ))),
                BottomNavigationBarItem(
                    backgroundColor: const Color(0xffB7935F),
                    label: isSelected ? "Ahadeth" : "",
                    icon: const ImageIcon(AssetImage(
                      "assets/images/hadeth.png",
                    ))),
                BottomNavigationBarItem(
                  backgroundColor: const Color(0xffB7935F),
                  icon: const Icon(Icons.settings),
                  label: isSelected ? "Settings" : "",
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
