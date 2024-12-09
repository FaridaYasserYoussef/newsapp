import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:newsapp/generated/l10n.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.controller, this.onChanged, required this.onCloseClicked});
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onCloseClicked;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70.h,
      child: TextField(
        cursorColor: AppColors.appBarBackgroundColor,
        
        controller: widget.controller,
        onChanged: widget.onChanged,
        
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.r), bottomRight: Radius.circular(30.r))
          ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.r), bottomRight: Radius.circular(30.r))
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.r), bottomRight: Radius.circular(30.r))
          ),
          suffixIconColor: AppColors.appBarBackgroundColor,
          prefixIconColor: AppColors.appBarBackgroundColor,
          suffixIcon: Icon(Icons.search,
          color: AppColors.appBarBackgroundColor,
          ),
          prefixIcon: IconButton(icon: Icon(Icons.close,
          color: AppColors.appBarBackgroundColor,
          ),
          onPressed: widget.onCloseClicked,
          ),
          hintText: S.of(context).SearchArticle,
          hintStyle: TextStyle(
            color: Color.fromRGBO(57, 165, 82, 0.28),
            fontSize: 14.sp
            )
    
        ),
      ),
    );
  }
}