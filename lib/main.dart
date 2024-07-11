import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app/helper/cache_helper.dart';
import 'package:islamic_app/screens/home/home_screen.dart';
import 'screens/ahadeth_details.dart';
import 'screens/sura_details_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path:
          'assets/translation', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      saveLocale: true,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
        AhadethDetailsScreen.routeName: (context) =>
            const AhadethDetailsScreen()
      },
    );
  }
}
