import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/Widgets/category_viewPage_tile.dart';
import 'package:news_api/bloc/news_bloc.dart';

class ScreenCategoryView extends StatefulWidget {
  final String category;
  const ScreenCategoryView({super.key, required this.category});

  @override
  State<ScreenCategoryView> createState() => _ScreenCategoryViewState();
}

class _ScreenCategoryViewState extends State<ScreenCategoryView> {
  NewsBloc newsbloc = NewsBloc();
  @override
  void initState() {
    newsbloc.add(NewsCategoryFetchevent(category: widget.category));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      centerTitle: true,
      backgroundColor: Colors.blue,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: BlocBuilder<NewsBloc, NewsState>(
        bloc: newsbloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case NewsLadingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case NewsCategoryFetchState:
              final sucessState = state as NewsCategoryFetchState;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CategoryViewpageTile(
                      articleModel: sucessState.categorieList[index]!);
                },
                itemCount: sucessState.categorieList.length,
              );
            case NewsErrorState:
              final sucessState = state as NewsErrorState;
              return Center(
                child: Text(sucessState.errorMessage),
              );

            default:
              return Center(
                child: Text("Loading....!"),
              );
          }
        },
      )),
    );
  }
}
