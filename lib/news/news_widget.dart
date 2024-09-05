import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source.dart';

import '../core/app_colors.dart';

class NewsWidget extends StatefulWidget {

Sources source;
NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManger.getNewsBySourceId(widget.source.id??''),
        builder: (context,snapshot){
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

                  ApiManger.getNewsBySourceId(widget.source.id??"");
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
                      ApiManger.getNewsBySourceId(widget.source.id??'');
                      setState(() {

                      });
                    }, child:Text('Try Again'))
              ],
            );
          }
          var newslist=snapshot.data!.articles!;
          return ListView.builder(itemBuilder: (context,index){
            return Text(newslist[index].title??'');
          },itemCount: newslist.length,);

        }
    );
  }
}
