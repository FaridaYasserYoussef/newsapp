// get news
// search news
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/common/services_locator.dart';
import 'package:newsapp/news/model/data_models/article.dart';
import 'package:newsapp/news/repository/news_repository.dart';
import 'package:newsapp/news/view_model/news_states.dart';

class NewsCubit extends Cubit<NewsState>{
  final NewsRepository newsrepository;
 NewsCubit():newsrepository = NewsRepository(dataSource: ServicesLocator.newsDataSource), super(NewsInitialState());

Future getNews(String sourceId, int page, String searchString) async{
  print("source id in cubit is ${sourceId}");
  // List<Article> currentArticles = [];
  // if(state is NewsSuccessState){
  //        currentArticles = (state as NewsSuccessState).articles;

  // }
  print("inside get news in cubit");
  emit(NewsLoadingState());
  // try{
  List<Article> articles = await newsrepository.getNews(sourceId, page, searchString);
  print("length of articles is ${articles.length}");
  if(page == 1){
    emit(NewsSuccessState(articles: articles));
    print("inside get page is 1");
  print(articles[0].title);

  }else{
    // if (state is NewsSuccessState) {
        
        // final updatedArticles = List<Article>.from(currentArticles)
        //   ..addAll(articles);
        emit(NewsSuccessState(articles: articles));
       print(articles[0].title);
      // }
      // else{
      //   emit(NewsErrorState(errorMessage: "something went wrong"));
      // }
  }

  // }catch(e){
  // emit(NewsErrorState(errorMessage: e.toString()));
  // }
        
}



}