import 'package:flutter/material.dart';
import 'package:news_app/core/app_them.dart';

import 'core/page_routs_generator.dart';
import 'core/page_routs_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutesName.news,
      title: 'News App',
      theme:ApplicationThem.lightthem,
      onGenerateRoute: RoutesGenerator.onGenerateRoutes,

    );
  }
}

