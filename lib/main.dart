import 'package:flutter/material.dart';
import 'package:news_app/core/app_them.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/news/news_details.dart';
import 'package:news_app/provider/settings_provider.dart';
import 'home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
     create: (context) => SettingsProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routename,
      title: 'News App',
      theme:ApplicationThem.lightthem,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),
        NewsDetails.routename:(context)=> NewsDetails(),
      },
      locale: Locale(provider.currentlanguge),
      //onGenerateRoute: RoutesGenerator.onGenerateRoutes,

    );
  }
}

