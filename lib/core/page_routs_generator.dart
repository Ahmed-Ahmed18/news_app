import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/page_routs_name.dart';
import 'package:news_app/modules/category_screen.dart';
import 'package:news_app/news/news_screen.dart';

class RoutesGenerator{

  static Route<dynamic> onGenerateRoutes(RouteSettings settings){

    switch(settings.name){
      case PageRoutesName.initial:
        return MaterialPageRoute(builder: (context)=>CategoryScreen(),
          settings: settings,
        );
      case PageRoutesName.news:
        return MaterialPageRoute(builder: (context)=>NewsScreen(),
            settings: settings
        );

      default :
        return MaterialPageRoute(builder: (context)=>CategoryScreen(),
          settings: settings,
        );
    }

  }
}