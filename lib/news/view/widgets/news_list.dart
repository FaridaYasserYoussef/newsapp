
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/widgets/custom_error_widget.dart';
import 'package:newsapp/common/widgets/loading_widget.dart';
import 'package:newsapp/news/model/data_models/article.dart';
import 'package:newsapp/news/view/widgets/news_card.dart';
import 'package:newsapp/news/view_model/news_cubit.dart';
import 'package:newsapp/news/view_model/news_states.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId, required this.page, required this.searchString});
  final String sourceId;
  final int page;
  final String searchString;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
late NewsCubit newsCubit;
late List<Article> articlesList = [];
bool isPageLoading = false;
 bool pageChanged = false;

  @override
  void initState() {
    super.initState();
newsCubit = NewsCubit();
newsCubit.getNews(widget.sourceId, widget.page, widget.searchString);

  }

  @override
  void didUpdateWidget(covariant NewsList oldWidget) {
    super.didUpdateWidget(oldWidget);
        //  print("page changed inside news list pdate trigerred ${widget.page}");

    if(oldWidget.page != widget.page){
     pageChanged = true;
     print("page changed inside news list");

    }

          newsCubit.getNews(widget.sourceId, widget.page, widget.searchString);

 if ((oldWidget.sourceId != widget.sourceId) || (oldWidget.page != widget.page) || (oldWidget.searchString != widget.searchString)) {
  // print("new widget source id is ${widget.sourceId}");
      newsCubit.getNews(widget.sourceId, widget.page, widget.searchString);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context)=> newsCubit,
    child: BlocBuilder<NewsCubit, NewsState>(builder: (context, state){
                          // articlesList.clear();

     if(state is NewsLoadingState){

      print("in news loading state");
      // if(pageChanged == true){
      //                 articlesList.clear();

      // }
      if(widget.page == 1){
              articlesList.clear();

      return const LoadingWidget();
      }
      else{
        isPageLoading = true;
      }
      
     }else if(state is NewsErrorState){
      print("in news error state");
      print(state.errorMessage);
      CustomErrorWidget(errorMessage: state.errorMessage);
     }else if(state is NewsSuccessState){
      if(state.articles.isNotEmpty){
      articlesList.addAll(state.articles);
      }
      isPageLoading = false;
       
     }

     return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: articlesList.length + (isPageLoading? 1: 0),
        itemBuilder: (context, index) {
          if(index == articlesList.length){

            return LoadingWidget();
          }
          final article = articlesList[index];

        if(article.title == "[Removed]"){
          return Container(
            height: 310.h,
            width: 360.w,
            child: Center(child: Text("This article was removed"),),
          );
        }
        return NewsCard(article: articlesList[index],);
      },
    );
     
      // return SizedBox();
    }),
    );
  }
}