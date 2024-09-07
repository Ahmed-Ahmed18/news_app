import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_colors.dart';

class NewsDetails extends StatefulWidget {
  static const String routename='newsDetails';
  const NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    var news=ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar:  AppBar(
        title: Text('Details',
          style:Theme.of(context).textTheme.bodySmall?.copyWith(

            color: AppColor.whitecolor
        ),
              
          ),),
      
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
        
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: CachedNetworkImage(
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
              Text(news.title!,
                style:Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColor.blackcolor,
                    fontSize: 18
                ) ,),
              Align(
                alignment:Alignment.topRight,
                child: Text(news.publishedAt!,style:Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                    fontSize: 13
                ) ,),
              ),
              SizedBox(height: 10,),
              Text(news.content!,
                style:Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColor.blackcolor,
                    fontSize: 15
                ) ,
               ),
    SizedBox(height: 15,),
              InkWell(
                onTap: (){
_launchUrl(news.url!);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('View Full Article',
                      style:Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColor.blackcolor,
                          fontSize: 15
                      ) ,  ),
                    Icon(Icons.arrow_forward_ios,color: AppColor.blackcolor,)
                  ],
                ),
              )

            ],
          ),
        ),
      ),
      );

  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $url');
  }

    }
}
