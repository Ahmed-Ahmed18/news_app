import 'package:flutter/painting.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Category{

  String id;
  String tittle;
  String imagepath;
  Color color;
  Category({
    required this.id,
    required this.tittle,
    required this.imagepath,
    required this.color
});
  /* business entertainment  health science  technology*/
  static List<Category>getCategories(context){
    return[
Category(id:'sports' , tittle:AppLocalizations.of(context)!.sport, imagepath:'assets/images/ball.png', color: AppColor.redcolor),
      Category(id:'general' , tittle:AppLocalizations.of(context)!.general, imagepath:'assets/images/environment.png', color: AppColor.darkbluecolor),
      Category(id:'health' , tittle:AppLocalizations.of(context)!.health, imagepath:'assets/images/health.png', color: AppColor.purplecolor),
      Category(id:'business' , tittle:AppLocalizations.of(context)!.business, imagepath:'assets/images/bussines.png', color: AppColor.orangecolor),
      Category(id:'entertainment' , tittle:AppLocalizations.of(context)!.entertainment, imagepath:'assets/images/ball.png', color: AppColor.lightbluecolor),
      Category(id:'science' , tittle:AppLocalizations.of(context)!.science, imagepath:'assets/images/science.png', color: AppColor.yelowcolor),

  ];
}
}