import 'package:newsapp/news/model/data_models/article.dart';

abstract class NewsState{}
class NewsInitialState extends NewsState{}
class NewsLoadingState extends NewsState{}
class NewsErrorState extends NewsState{
 final String errorMessage;

  NewsErrorState({required this.errorMessage});
}
class NewsSuccessState extends NewsState{
  final List<Article> articles;

  NewsSuccessState({required this.articles});
}
