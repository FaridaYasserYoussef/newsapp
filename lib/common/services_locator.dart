
import 'package:newsapp/sources/model/data_sources/sources_api_data_source.dart';
import 'package:newsapp/sources/model/data_sources/sources_data_source.dart';

class ServicesLocator{
  static  SourcesDataSource sourcesDataSource = SourcesApiDataSource();
}