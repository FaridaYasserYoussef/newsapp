import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_assets.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:newsapp/common/enums/categoryTypes.dart';
import 'package:newsapp/common/enums/tabs.dart';
import 'package:newsapp/news/view/screens/news_screen.dart';
import 'package:newsapp/news/view/widgets/customSearchBar.dart';
import 'package:newsapp/settings/view/screens/settings_screen.dart';
import 'package:newsapp/sources/view/screens/categories_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    // This widget is the root of your application.
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabType currentTab = TabType.CategoriesTab;
  CategoryType? categoryType;
  String? categoryName;
  String? categoryId;
  bool searchBarVisible = false;
  String searchString = "";
  TextEditingController searchBarController = TextEditingController();

  toggleDrawer() async {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }

    // else {
    //   _scaffoldKey.currentState!.openDrawer();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              drawer:searchBarVisible == false? 
              Drawer(
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
                          toggleDrawer();
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
                          toggleDrawer();
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
              ): null,
              appBar: AppBar(
                
                actions: (categoryName != null && searchBarVisible == false)
                    ? [
                        IconButton(
                            onPressed: () {
                              searchBarVisible = true;
                              setState(() {
                                
                              });
                            },
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ))
                      ]
                    : null,
                backgroundColor: AppColors.appBarBackgroundColor,
                centerTitle: true,
                flexibleSpace: Center(
                  child: searchBarVisible? CustomSearchBar(
                    onChanged: (p0) {
                      searchString = p0;
                      setState(() {
                        
                      });
                    },
                    controller: searchBarController, onCloseClicked: () {
                  searchBarVisible = false;
                  searchString = "";
                  searchBarController.text = "";
                  setState(() {
                    
                  });
                },): null
                
                ,),
                title:  Text(
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
                      searchString: searchString,
                        categoryType: categoryType!,
                        categoryId: categoryId!,
                      ),
              ),
            ),
          );
  }
}