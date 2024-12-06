
import 'package:newsapp/news/model/data_models/article.dart';

abstract class NewsDataSource{
  Future<List<Article>> getNews(String sourceId, int page, String searchString);
}