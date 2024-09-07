import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source.dart';
class ApiManger {
  static Future<Source?> getSources(String categoryid) async {
    Uri url = Uri.https(ApiConstants.baseurl, ApiConstants.sourceApi,
        {
          'apiKey': '35f8bd9fdd084c649935379b5f7231a7',
          'category':categoryid
        });
    var response = await http.get(url);
    try {

      return Source.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=35f8bd9fdd084c649935379b5f7231a7

  static Future<NewsResponse> getNewsBySourceId ({String? sourceId,String? quary})async{

    Uri url=Uri .https(ApiConstants.baseurl,ApiConstants.newsApi,{
      'apiKey':'35f8bd9fdd084c649935379b5f7231a7',
      'sources':sourceId,
      'q':quary
    });
    var response=await http.get(url);
    try{
      return NewsResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }
}
}