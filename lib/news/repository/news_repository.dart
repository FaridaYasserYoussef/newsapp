import 'package:newsapp/news/model/data_models/article.dart';
import 'package:newsapp/news/model/data_sources/news_data_sources.dart';

class NewsRepository{
   final NewsDataSource dataSource;

  NewsRepository({required this.dataSource});
  
    Future<List<Article>> getNews(String sourceId, int page, String searchString) async{
      // print("in news repo");
      return await dataSource.getNews(sourceId, page, searchString);
    }

}