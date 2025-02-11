import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/Model/article_model.dart';
import 'package:news_api/Routs/route_names.dart';

class CategoryViewpageTile extends StatelessWidget {
  final ArticleModel articleModel;
  const CategoryViewpageTile({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RouteNames.webView, arguments: articleModel.url);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 10,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: articleModel.urlToImage,
                  height: MediaQuery.sizeOf(context).height / 4,
                  width: MediaQuery.sizeOf(context).width / 1.2,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => Text(error.toString()),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Text(
                    articleModel.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Text(
                    articleModel.description,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
