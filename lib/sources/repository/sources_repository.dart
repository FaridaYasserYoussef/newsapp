import 'package:newsapp/sources/model/data_models/source.dart';
import 'package:newsapp/sources/model/data_sources/sources_data_source.dart';

class SourcesRepository {
  final SourcesDataSource dataSource;

  SourcesRepository({required this.dataSource});

  Future<List<Source>> getSources(String catId) async {
    return await dataSource.getSources(catId);
  }
}
