import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/news/news_details.dart';

class NewsItem extends StatelessWidget {

  News news;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routename,
        arguments: news);
      },
      child: Container(
        margin: EdgeInsets.all(10),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          ),
        child:CachedNetworkImage(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*.3,
          fit: BoxFit.fill,
          imageUrl: news.urlToImage??'',
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
              color: AppColor.primarycolor,
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),


          ),

          SizedBox(height: 10,),

          Text(news.author??'',
            style:Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey,
              fontSize: 12
            ) ,
          ),
          SizedBox(height: 10,),
          Text(news.title??'',
            style:Theme.of(context).textTheme.bodySmall?.copyWith(
                color:AppColor.blackcolor,
                fontSize: 15
            ) ,
          ),
          SizedBox(height: 10,),

          Text(news.publishedAt??'',
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey,
              fontSize: 10
            ),
          ),
        ],
      ),
      ),
    ) ;
  }
}
