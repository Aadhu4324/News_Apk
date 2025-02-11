import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_api/Model/category_model.dart';
import 'package:news_api/Model/model_list.dart';
import 'package:news_api/Widgets/catergory_tile.dart';
import 'package:news_api/Widgets/custom_text.dart';
import 'package:news_api/Widgets/hot_news_tile.dart';
import 'package:news_api/Widgets/latest_news_tile.dart';
import 'package:news_api/bloc/news_bloc.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  NewsBloc newsBloc = NewsBloc();

  @override
  void initState() {
    newsBloc.add(NewsFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsBloc, NewsState>(
        bloc: newsBloc,
        builder: (context, state) {
          log(state.runtimeType.toString());
          switch (state.runtimeType) {
        
            case NewsLadingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case NewsSucessState:
              final sucessState = state as NewsSucessState;
              return SafeArea(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Breaking",
                              size: 30,
                              color: Colors.red,
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: "News",
                              size: 30,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Divider(),
                        CustomText(
                          text: "Latest News",
                          size: 20,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * .35,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return LatestNewsTile(
                                  articleModel: sucessState.latestnews[index]);
                            },
                            itemCount: sucessState.latestnews.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Categories",
                          size: 22,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              List<CategoryModel> categories = categoryList
                                  .map(
                                    (e) => CategoryModel.fromJson(e),
                                  )
                                  .toList();
                              return CatergoryTile(
                                imageurl: categories[index].imageurl,
                                name: categories[index].name,
                              );
                            },
                            itemCount: categoryList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        Divider(),
                        CustomText(
                          text: "Hot News",
                          size: 22,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: HotNewsTile(
                                  articleModel: sucessState.hotList[index],
                                ),
                              );
                            },
                            itemCount: sucessState.hotList.length,
                            scrollDirection: Axis.vertical,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
               case NewsErrorState:
               final sucessState = state as NewsErrorState;
               return Center(child: Text(sucessState.errorMessage),);
            default:
              return Center(
                child: Text("Intialising"),
              );
          }
        },
      ),
    );
  }
}
