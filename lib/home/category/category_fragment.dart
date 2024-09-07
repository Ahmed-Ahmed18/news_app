import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_item.dart';
import 'package:news_app/model/category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CategoryFragment extends StatefulWidget {


  Function onCategoryItemClicked;
  CategoryFragment({required this.onCategoryItemClicked});

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {


  @override
  Widget build(BuildContext context) {
    var categorylist= Category.getCategories(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.home_message,
            textAlign: TextAlign.start,
            style:Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 20
            ) ,),
          SizedBox(height: 15,),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
              itemBuilder:(context,index)=>
                  InkWell(
                    onTap: (){
                      widget.onCategoryItemClicked( categorylist[index]);
                    },
                      child: CategoryItem(category:categorylist[index] ,index: index,)),
              itemCount:categorylist.length ,
            ),
          )
        ],
      ),
    );
  }
}
