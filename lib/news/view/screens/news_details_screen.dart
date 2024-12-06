import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_assets.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:newsapp/news/model/data_models/article.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.newsArticle});
  final Article newsArticle;


  Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

  @override
  Widget build(BuildContext context) {
      final Uri url = Uri.parse(newsArticle.url!);

    return Scaffold(
      appBar: AppBar(
                backgroundColor: AppColors.appBarBackgroundColor,
                centerTitle: true,
                title: Text(
                  newsArticle.title!,
                  style: const TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.r),
                        bottomRight: Radius.circular(50.r))),
              ),
     body:  Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets.backgroundPattern),
                        fit: BoxFit.cover)
                        ),

                        child: SingleChildScrollView(child: 
                        
                        Column(children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 20),
                           child: CachedNetworkImage(imageUrl:  newsArticle.urlToImage!,
                                    errorWidget: (context, url, error) {
                                      return Image(image: AssetImage(AppAssets.imageNotFound));
                                    },
                                   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                         
                                    height: 232.h,
                                   width: double.infinity.w,
                                    ),
                         ),
            
            // Text(newsArticle.source!.name!,
            // style: TextStyle(color: Color(0xff79828B),
            // fontSize: 10.sp
            // ),
            // ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(newsArticle.source!.name!,
              style: TextStyle(color: Color(0xff42505C),
              fontSize: 14.sp
              ),
              ),
           ),

                Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if(newsArticle.publishedAt != null) Padding(
                padding:  EdgeInsets.only(right: 20.w, top: 10.h, bottom: 10.h),
                child: Text(timeago.format(DateTime.parse(newsArticle.publishedAt!)), style: TextStyle(color: Color(0xffA3A3A3), fontSize: 13.sp),),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('''${newsArticle.content}''',
            style: TextStyle(color: Color(0xff42505C),
            fontSize: 13.sp
            ),
            ),
          ),

             Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             TextButton(onPressed: () async{
             await _launchUrl(url);
             }, child: Row(
               children: [
                 Text("View Full Article", 
                 style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black),
                 ),
                 Icon(Icons.arrow_forward, color: Colors.black, size: 20,)
               ],
             ) )
            ],
          ),



                        ]
                        
                        )),
                        ),

    );
  }
}