import 'package:flutter/material.dart';
import 'package:newsapp/common/app_assets.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:newsapp/common/enums/categoryTypes.dart';
import 'package:newsapp/common/enums/tabs.dart';
import 'package:newsapp/homePage.dart';
import 'package:newsapp/news/view/screens/news_screen.dart';
import 'package:newsapp/settings/view/screens/settings_screen.dart';
import 'package:newsapp/sources/view/screens/categories_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}
