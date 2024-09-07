import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Homedrawer extends StatelessWidget {

static const int category=1;
static const int settings=2;
  Function onSideMenuClicked;
  Homedrawer({required this.onSideMenuClicked});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColor.primarycolor,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height*.09),
          width: double.infinity,
          child: Text(AppLocalizations.of(context)!.news_app,
            textAlign: TextAlign.center ,
          style: Theme.of(context).textTheme.bodySmall,),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: InkWell(
            onTap: (){
              onSideMenuClicked(category);
            },
            child: Row(
              children: [
                Icon(Icons.list,color:AppColor.blackcolor,size: 35,),
                SizedBox(width: 10,),
                Text(AppLocalizations.of(context)!.categories,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 20
                ),)
              ],
            ),
          ),
        ),

        Padding(
          padding:EdgeInsets.all(10)

          ,child: InkWell(
          onTap: (){
          onSideMenuClicked(settings) ;
          },
            child: Row(
              children: [
                Icon(Icons.settings,color:AppColor.blackcolor,size: 35,),
                SizedBox(width: 10,),
                Text(AppLocalizations.of(context)!.settings,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 20
                ),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

