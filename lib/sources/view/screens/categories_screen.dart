
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_assets.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:newsapp/common/enums/categoryTypes.dart';
import 'package:newsapp/generated/l10n.dart';
import 'package:newsapp/sources/model/data_models/category_model.dart';
import 'package:newsapp/sources/view/widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  void Function(CategoryType, String, String) categoryChangeCallback;
  CategoriesScreen({super.key, required this.categoryChangeCallback});
  
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoryModels = [
    CategoryModel(
        categoryName: S.of(context).Sports,
        categoryImagePath: AppAssets.sportsCategoryImage,
        color: Color(0xffC91C22),
        categoryType: CategoryType.Sports,
        categoryId: "sports"),
    CategoryModel(
        categoryName: S.of(context).Health,
        categoryImagePath: AppAssets.healthCategoryImage,
        color: Color(0xffED1E79),
        categoryType: CategoryType.Health,
        categoryId: "health"),
    CategoryModel(
        categoryName: S.of(context).Business,
        categoryImagePath: AppAssets.businessCategoryImage,
        color: Color(0xffCF7E48),
        categoryType: CategoryType.Business,
        categoryId: "business"),
    CategoryModel(
        categoryName: S.of(context).Science,
        categoryImagePath: AppAssets.scienceCategoryImage,
        color: Color(0xffF2D352),
        categoryType: CategoryType.Science,
        categoryId: "science"),
  ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 40.w),
          child: Text(S.of(context).Phrase,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  color: Color(0xff4F5A69))),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: categoryModels.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return CategoryCard(
                index: index,
                categoryModel: categoryModels[index],
                categoryChangeCallback: categoryChangeCallback,
              );
            },
          ),
        )
      ],
    );
  }
}
