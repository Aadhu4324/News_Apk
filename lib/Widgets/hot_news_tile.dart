import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/Model/article_model.dart';
import 'package:news_api/Routs/route_names.dart';

class HotNewsTile extends StatelessWidget {
  final ArticleModel? articleModel;
  const HotNewsTile({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RouteNames.webView, arguments: articleModel!.url);
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.of(context).size.height * 0.12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              errorWidget: (context, url, error) => Text(error.toString()),
              imageUrl: articleModel!.urlToImage,
              width: MediaQuery.sizeOf(context).width / 3,
              height: 100,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width / 2,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Text(
                      articleModel!.title,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.023),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: Text(
                      articleModel!.description,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.012),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
