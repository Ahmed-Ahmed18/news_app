import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/model/source.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Sources source;
  TabItem({required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColor.primarycolor,
          width: 2
        ),
        color: isSelected?AppColor.primarycolor : Colors.transparent
      ),
        child: Text(source.name??'',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: isSelected? AppColor.whitecolor:AppColor.primarycolor,
          fontSize: 15

),),

    );
  }
}
