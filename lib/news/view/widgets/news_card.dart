
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_assets.dart';
import 'package:newsapp/news/model/data_models/article.dart';
import 'package:newsapp/news/view/screens/news_details_screen.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';
class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => NewsDetailsScreen(newsArticle: article),));
      },
      child: Container(
        // height: 310.h,
        width: 360.w,
        child: Column(
          children: [
              CachedNetworkImage(imageUrl:  article.urlToImage!,
             errorWidget: (context, url, error) {
               return Image(image: AssetImage(AppAssets.imageNotFound));
             },
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    
             height: 232.h,
            width: 360.w,
             ), 
            
    
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:  EdgeInsets.only(left: 30.w),
                child: Text(article.source!.name!,
                        
                style: TextStyle(color: Color(0xff79828B), fontSize: 10.sp, ),),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(article.title!, style: TextStyle(
                  overflow: TextOverflow.visible,
                  color: Color(0xff42505C),
                  fontSize: 14.sp
                ),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if(article.publishedAt != null) Padding(
                  padding:  EdgeInsets.only(right: 20.w, top: 10.h, bottom: 10.h),
                  child: Text(timeago.format(DateTime.parse(article.publishedAt!)), style: TextStyle(color: Color(0xffA3A3A3), fontSize: 13.sp),),
                )
              ],
            )
    
          ],
        ),
      ),
    );
  }
}