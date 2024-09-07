import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/settings_provider.dart';


class Settings extends StatelessWidget {
   Settings({super.key});


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    List<String>language=[
      AppLocalizations.of(context)!.english,
      AppLocalizations.of(context)!.arabic

    ];
   return Container(
     margin: EdgeInsets.all(20),
     child: Column(
       
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.bodySmall?.copyWith(
           color: AppColor.blackcolor
         ),),
         CustomDropdown<String>(
           decoration: CustomDropdownDecoration(
             listItemDecoration: ListItemDecoration(
               selectedColor: AppColor.primarycolor,
     
             ),
             closedBorderRadius: BorderRadius.circular(15),
     
             closedFillColor:AppColor.whitecolor,
             expandedFillColor: AppColor.whitecolor,
             closedSuffixIcon: Icon(
                 Icons.keyboard_arrow_down_sharp,
                 color:AppColor.primarycolor
             ),
             expandedSuffixIcon: Icon(
                 Icons.keyboard_arrow_up_sharp,
                 color: AppColor.primarycolor
             ),
           ),
           hintText: 'Select Your Language',
           items: language,
           initialItem:  provider.currentlanguge == 'en'
         ? language[0]
        : language[1],
    onChanged: (value) {
    if (value == AppLocalizations.of(context)!.english) {
    provider.changeLanguageCode('en');
    }
    if (value == AppLocalizations.of(context)!.arabic) {
    provider.changeLanguageCode('ar');
    }
             log('changing value to: $value');
           },
         ),
       ],
     ),
   );
  }
}
