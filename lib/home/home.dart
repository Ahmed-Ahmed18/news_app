import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/drawer/homedrawer.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/source.dart';
import 'package:news_app/search.dart';
import 'package:news_app/settings/settings.dart';
import 'package:news_app/tabs/tabs_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
static const String routename='layout';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var them=Theme.of(context);
    return Stack(
      children: [
        Container(
          color:AppColor.whitecolor,
          child: Image.asset('assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
          fit: BoxFit.cover,),

        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedcategory==null
                  ?
              AppLocalizations.of(context)!.news_app
              :selectedcategory!.tittle,
              style:them.textTheme.bodySmall?.copyWith(
                  color: AppColor.whitecolor
              ),),
            actions: [
              IconButton(onPressed: (){
                showSearch(context: context, delegate: SearchWidget());
              }, icon: Icon(Icons.search,color: AppColor.blackcolor,))
            ],
          ),
          drawer: Drawer(
            child: Homedrawer(onSideMenuClicked: onSideMenuClicked)
          ),
          body: selecteditem==Homedrawer.settings ?
          Settings()
              :
          selectedcategory==null?
          CategoryFragment(onCategoryItemClicked:onCategoryItemClicked ,)
          :CategoryDetails(category: selectedcategory!,),
        ),
      ],
    );

  }
  Category? selectedcategory;
  void onCategoryItemClicked(Category newcategory){
selectedcategory=newcategory;
setState(() {

});

  }

  int selecteditem=Homedrawer.category;
  void onSideMenuClicked(int newSideMenuItem){
    selecteditem=newSideMenuItem;
    selectedcategory=null;
    Navigator.pop(context);
setState(() {
  
});    

  }
}

