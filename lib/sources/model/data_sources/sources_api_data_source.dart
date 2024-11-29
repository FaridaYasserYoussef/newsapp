
import 'dart:convert';

import 'package:newsapp/common/api_consts.dart';
import 'package:newsapp/sources/model/data_models/source.dart';
import 'package:newsapp/sources/model/data_models/source_model.dart';
import 'package:newsapp/sources/model/data_sources/sources_data_source.dart';
import 'package:http/http.dart' as http;
class SourcesApiDataSource extends SourcesDataSource{
  @override
  Future<List<Source>> getSources(String catId) async{
  final  url = Uri.https(APIConsts.baseUrl, APIConsts.sourcesEndpoint, {
    "apiKey": APIConsts.apiKey,
   "category": catId
  });

   var response = await http.get(url);

    final jsonData = jsonDecode(response.body);
    SourceModel sourceModel = SourceModel.fromJson(jsonData);
    if(sourceModel.status == "ok"){
       List<Source> sourcesList = sourceModel.sources ?? [];
    return sourcesList;
    }else{
      throw Exception(sourceModel.status);

    }
   



  }

}