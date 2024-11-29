import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/common/enums/categoryTypes.dart';
import 'package:newsapp/common/widgets/custom_error_widget.dart';
import 'package:newsapp/common/widgets/loading_widget.dart';
import 'package:newsapp/sources/view/widgets/sources_list.dart';
import 'package:newsapp/sources/view_model/sources_cubit.dart';
import 'package:newsapp/sources/view_model/sources_states.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen(
      {super.key, required this.categoryType, required this.categoryId});
  final CategoryType categoryType;
  final String categoryId;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  
  late SourcesCubit sourcesCubit;

 @override
  void initState() {
    super.initState();

    sourcesCubit = SourcesCubit();
    sourcesCubit.getSources(widget.categoryId);

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:ListView(children: [
        BlocProvider(create:(context) => sourcesCubit,
        child: BlocBuilder<SourcesCubit, SourcesState>(
          builder: (context, state) {
          if(state is SourcesLoadingState){
            return LoadingWidget();
          }else if(state is SourcesErrorState){
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else if(state is SourcesSuccessState){
            return SourcesList(sourcesList: state.sourcesList);
          }
          return SizedBox();
        },),
        )
      ],),
    );
  }
}
