import 'package:flutter/material.dart';

import 'api/api_manger.dart';
import 'core/app_colors.dart';
import 'news/news_item.dart';

class SearchWidget extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
return [

IconButton(onPressed: (){
  showResults(context);
}, icon: Icon(Icons.search)),
];


  }

  @override
  Widget? buildLeading(BuildContext context) {
return IconButton(onPressed: (){
  Navigator.pop(context);
}, icon:Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
return FutureBuilder(
    future: ApiManger.getNewsBySourceId(quary: query),
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

              ApiManger.getNewsBySourceId(quary: query);

            }, child:Text('Try Again')))
          ],
        );
      }if(snapshot.data!.status=='error'){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
            Text('No result'),

          ],
        );
      }
      var newslist=snapshot.data!.articles!;
      return ListView.builder(itemBuilder: (context,index){
        return NewsItem(news: newslist[index]);
      },itemCount: newslist.length,);

    }
);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  return FutureBuilder(
      future: ApiManger.getNewsBySourceId(quary: query),
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

                ApiManger.getNewsBySourceId(quary: query);

              }, child:Text('Try Again')))
            ],
          );
        }if(snapshot.data!.status=='error'){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text('No result',
                  style:Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 15,
                    color: Colors.grey
                  ) ,
                ),
              ),

            ],
          );
        }
        var newslist=snapshot.data!.articles!;
        return ListView.builder(itemBuilder: (context,index){
          return NewsItem(news: newslist[index]);
        },itemCount: newslist.length,);

      }
  );
  }

}
