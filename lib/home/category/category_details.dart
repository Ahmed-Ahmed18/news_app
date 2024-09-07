import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

import '../../api/api_manger.dart';
import '../../core/app_colors.dart';
import '../../model/source.dart';
import '../../tabs/tabs_widget.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails({required this.category});
  static const String routenamed='/';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Source?>(
        future: ApiManger.getSources(widget.category.id),
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(
              color: AppColor.primarycolor,
            ),);
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something Went Wrong',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColor.blackcolor,
                    fontSize: 16
                ),),
                Center(child: ElevatedButton(onPressed: (){

                  ApiManger.getSources(widget.category.id);
                  setState(() {

                  });
                }, child:Text('Try Again')))
              ],
            );
          }if(snapshot.data!.status=='error'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: (){
                      ApiManger.getSources(widget.category.id);
                      setState(() {

                      });
                    }, child:Text('Try Again'))
              ],
            );
          }
          var sourcelist=snapshot.data!.sources!;
          return TabsWidget(sourcelist: sourcelist);
        });;
  }

}
