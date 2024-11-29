import 'package:flutter/material.dart';
import 'package:newsapp/common/app_assets.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:newsapp/common/enums/categoryTypes.dart';
import 'package:newsapp/common/enums/tabs.dart';
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
  // This widget is the root of your application.

  TabType currentTab = TabType.CategoriesTab;
  CategoryType? categoryType;
  String? categoryName;
  String? categoryId;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: Scaffold(
              drawer: Drawer(
                width: 326.w,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: AppColors.appBarBackgroundColor,
                        height: 110.h,
                        width: 326.w,
                        child: Center(
                            child: Text(
                          "News App!",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.sp),
                        )),
                      ),
                      GestureDetector(
                        onTap: () {
                          currentTab = TabType.CategoriesTab;
                          categoryName = null;
                          categoryType = null;
                          setState(() {});
                        },
                        child: ListTile(
                          leading:
                              Icon(Icons.list, color: Colors.black, size: 30),
                          title: Text("Categories",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          currentTab = TabType.SettingsTab;
                          categoryName = null;
                          categoryType = null;
                          setState(() {});
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: Colors.black,
                            size: 30,
                          ),
                          title: Text(
                            "Settings",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp),
                          ),
                        ),
                      ),
                    ]),
              ),
              appBar: AppBar(
                actions: categoryName != null
                    ? [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ))
                      ]
                    : null,
                backgroundColor: AppColors.appBarBackgroundColor,
                centerTitle: true,
                title: Text(
                  categoryName == null ? "News App" : categoryName!,
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.r),
                        bottomRight: Radius.circular(50.r))),
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets.backgroundPattern),
                        fit: BoxFit.cover)),
                child: categoryType == null
                    ? (currentTab == TabType.CategoriesTab
                        ? CategoriesScreen(
                            categoryChangeCallback: (type, name, id) {
                              categoryName = name;
                              categoryType = type;
                              categoryId = id;
                              setState(() {});
                            },
                          )
                        : SettingsScreen())
                    : NewsScreen(
                        categoryType: categoryType!,
                        categoryId: categoryId!,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
