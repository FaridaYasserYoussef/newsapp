import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/enums/categoryTypes.dart';
import 'package:newsapp/sources/model/data_models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  void Function(CategoryType, String, String) categoryChangeCallback;

  CategoryCard(
      {super.key,
      required this.index,
      required this.categoryModel,
      required this.categoryChangeCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          categoryChangeCallback(categoryModel.categoryType,
              categoryModel.categoryName, categoryModel.categoryId);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: index.isEven
                  ? BorderRadiusDirectional.only(
                      topEnd: Radius.circular(25.r),
                      topStart: Radius.circular(25.r),
                      bottomStart: Radius.circular(25.r))
                  : BorderRadiusDirectional.only(
                      topEnd: Radius.circular(25.r),
                      topStart: Radius.circular(25.r),
                      bottomEnd: Radius.circular(25.r)),
              color: categoryModel.color),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage(categoryModel.categoryImagePath)),
              Text(
                categoryModel.categoryName,
                // overflow: TextOverflow.clip,
                style: TextStyle(color: Colors.white, fontSize: 17.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
