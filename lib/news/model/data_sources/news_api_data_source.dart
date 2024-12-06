import 'dart:convert';

import 'package:newsapp/common/api_consts.dart';
import 'package:newsapp/news/model/data_models/article.dart';
import 'package:newsapp/news/model/data_models/news_model.dart';
import 'package:newsapp/news/model/data_sources/news_data_sources.dart';
import 'package:http/http.dart' as http;

class NewsApiDataSource extends NewsDataSource{
  @override
  Future<List<Article>> getNews(String sourceId, int page, String searchString) async{
    // print("in news api data source");
    // print(sourceId);
    Uri url;
    if(searchString == ""){
       url = Uri.https(APIConsts.baseUrl, APIConsts.newsEndpoint,{
    "sources": sourceId,
    "apiKey" : APIConsts.apiKey,
    "pageSize": '10',
    "page": page.toString()
   });
    }else{
    url = Uri.https(APIConsts.baseUrl, APIConsts.newsEndpoint,{
    "sources": sourceId,
    "apiKey" : APIConsts.apiKey,
    "pageSize": '10',
    "page": page.toString(),
    "q": searchString

   });
    }
  
  //  print("url path here is ${url.queryParameters}");
   var response = await http.get(url);
   final jsonData = jsonDecode(response.body);
   print(jsonData);
   NewsModel newsModel = NewsModel.fromJson(jsonData);

   if(newsModel.status == "ok"){
    print("news status is okay");
    return newsModel.articles ?? [];
   }
   else{
    print("news status is not okay");
    if(jsonData["code"] == "maximumResultsReached"){
      throw Exception("no more articles");
    }
    throw Exception(newsModel.status);
   }

  }

}