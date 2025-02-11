import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/Model/article_model.dart';
import 'package:news_api/Routs/route_names.dart';

class LatestNewsTile extends StatelessWidget {
  final ArticleModel? articleModel;
  const LatestNewsTile({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        child: Column(
          children: [
            CachedNetworkImage(
              errorWidget: (context, url, error) => Text(error.toString()),
              imageUrl: articleModel!.urlToImage,
              width: MediaQuery.sizeOf(context).width / 2.2,
              height: MediaQuery.sizeOf(context).height / 7,
              fit: BoxFit.fill,
            ),
            SizedBox(
                width: MediaQuery.sizeOf(context).width / 2.2,
                child: Text(
                  articleModel!.title,
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height / 43,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )),
            SizedBox(
                width: MediaQuery.sizeOf(context).width / 2.2,
                child: Text(
                  articleModel!.description,
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height / 65,
                      fontWeight: FontWeight.normal),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 2.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteNames.webView,
                            arguments: articleModel!.url);
                      },
                      icon: Icon(
                        Icons.arrow_circle_right_rounded,
                        color: Colors.blue,
                        size: 25,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
