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
      {super.key, required this.categoryType, required this.categoryId, required this.searchString});
  final CategoryType categoryType;
  final String categoryId;
  final String searchString;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late SourcesCubit sourcesCubit;
  ScrollController scrollController = ScrollController();
  int page = 1;

  @override
  void didUpdateWidget(covariant NewsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(oldWidget.searchString != widget.searchString){
      print("changed search String ${widget.searchString}");
      page = 1;
      setState(() {
        
      });
    }
  }

  @override
  void initState() {
    super.initState();

    sourcesCubit = SourcesCubit();
    sourcesCubit.getSources(widget.categoryId);
    scrollController.addListener(_onScroll);

  }

    @override
  void dispose() {
    // Dispose of the ScrollController to avoid memory leaks
    scrollController.dispose();
    super.dispose();
  }


   void _onScroll() {
    if (scrollController.position.atEdge) {
      bool isBottom = scrollController.position.pixels ==
          scrollController.position.maxScrollExtent;
      if (isBottom) {
        // Increment the page number and update the state
        setState(() {
          page++;
        });

        // Optionally, fetch more data or trigger any other logic
        print('Reached the end of the list. Page: $page');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        BlocProvider(
          create: (context) => sourcesCubit,
          child: BlocBuilder<SourcesCubit, SourcesState>(
            builder: (context, state) {
              if (state is SourcesLoadingState) {
                return const LoadingWidget();
              } else if (state is SourcesErrorState) {
                return CustomErrorWidget(errorMessage: state.errorMessage);
              } else if (state is SourcesSuccessState) {
                return SourcesList(sourcesList: state.sourcesList, page: page, searchString: widget.searchString,);
              }
              return SizedBox();
            },
          ),
        )
      ],
    );
  }
}
