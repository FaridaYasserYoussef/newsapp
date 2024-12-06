import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:newsapp/news/view/widgets/news_list.dart';
import 'package:newsapp/sources/model/data_models/source.dart';

class SourcesList extends StatefulWidget {
  const SourcesList({super.key, required this.sourcesList, required this.page, required this.searchString});
  final List<Source> sourcesList;
  final int page;
  final String searchString;

  @override
  State<SourcesList> createState() => _SourcesListState();
}

class _SourcesListState extends State<SourcesList> {
  late String selectedSourceId;
  // int page = 1;
 late int page;

  @override
  void initState() {
    super.initState();
    selectedSourceId = widget.sourcesList[0].id!;
    page = widget.page;
  }

  @override
  void didUpdateWidget(covariant SourcesList oldWidget) {
    super.didUpdateWidget(oldWidget);
     if(oldWidget.page != widget.page){
    //  pageChanged = true;
     print("page changed inside sources list");
     setState(() {
       page = widget.page;
     });
    }
    if((oldWidget.page != widget.page) || (oldWidget.searchString != widget.searchString) ){
      // page = widget.page;
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: SizedBox(
            height: 60.h,
            child: ListView.builder(
              itemCount: widget.sourcesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // print(widget.sourcesList[index].id);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChoiceChip(
                      onSelected: (value) {
                        
                        setState(() {
                           page = 1;
                          selectedSourceId = widget.sourcesList[index].id!;
                        });
                      },
                      selectedColor: AppColors.appBarBackgroundColor,
                      label: Text(
                        widget.sourcesList[index].name!,
                        style: TextStyle(
                            color:
                                widget.sourcesList[index].id == selectedSourceId
                                    ? Colors.white
                                    : Colors.black),
                      ),
                      selected:
                          widget.sourcesList[index].id == selectedSourceId),
                );
              },
            ),
          ),
        ),

       NewsList(sourceId: selectedSourceId, page: page, searchString: widget.searchString)
      ],
    );
  }
}
