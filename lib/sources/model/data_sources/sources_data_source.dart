import 'package:newsapp/sources/model/data_models/source.dart';

abstract class SourcesDataSource{
  Future<List<Source>> getSources(String catId);
}