import 'package:newsapp/news/model/data_sources/news_api_data_source.dart';
import 'package:newsapp/news/model/data_sources/news_data_sources.dart';
import 'package:newsapp/sources/model/data_sources/sources_api_data_source.dart';
import 'package:newsapp/sources/model/data_sources/sources_data_source.dart';

class ServicesLocator {
  static SourcesDataSource sourcesDataSource = SourcesApiDataSource();
  static NewsDataSource newsDataSource = NewsApiDataSource();
}
