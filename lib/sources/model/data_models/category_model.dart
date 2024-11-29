import 'package:flutter/material.dart';
import 'package:newsapp/common/enums/categoryTypes.dart';

class CategoryModel {
  final String categoryId;
  final String categoryName;
  final String categoryImagePath;
  final Color color;
  final CategoryType categoryType;

  CategoryModel(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryImagePath,
      required this.color,
      required this.categoryType});
}
