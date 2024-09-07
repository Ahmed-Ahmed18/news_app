import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

class CategoryItem extends StatelessWidget {

Category category;
int index;
CategoryItem({required this.category,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color:category.color ,
        borderRadius: BorderRadius.only(
          bottomRight:Radius.circular(index %2 != 0? 25:0),
          bottomLeft:Radius.circular(index %2 == 0? 25:0) ,
          topLeft:Radius.circular(25) ,
          topRight:Radius.circular(25)
        )
      ),

      child: Column(
           children: [
             Image.asset(category.imagepath,height: MediaQuery.of(context).size.height*.15,),
             Text(category.tittle,style: Theme.of(context).textTheme.bodySmall?.copyWith(
               fontSize: 17
             ),),
           ],
      ),
    )  ;
  }
}
