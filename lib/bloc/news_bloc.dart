import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_api/Api/api_services.dart';
import 'package:news_api/Model/article_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  ApiServices api = ApiServices();
  NewsBloc() : super(NewsInitial()) {
    on<NewsFetchEvent>(newsFecthEvent);
    on<NewsCategoryFetchevent>(newsCategoryFetchEvent);
  }
  FutureOr<void> newsFecthEvent(
      NewsFetchEvent event, Emitter<NewsState> emit) async {
    emit(NewsLadingState());
    try {
      var latestData = await api.getTopNews();
      var hotData = await api.getAllNews();
      List<ArticleModel?> latestList = latestData
          .where(
            (element) => element != null,
          )
          .toList();
      List<ArticleModel?> hotList = hotData
          .where(
            (element) => element != null,
          )
          .toList();
      await Future.delayed(Duration(seconds: 0));
      emit(NewsSucessState(hotList: hotList, latestnews: latestList));
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> newsCategoryFetchEvent(
      NewsCategoryFetchevent event, Emitter<NewsState> emit) async {
    emit(NewsLadingState());
    try {
      var categorydata = await api.getCategoryNews(event.category);
      List<ArticleModel?> categoryList = categorydata
          .where(
            (element) => element != null,
          )
          .toList();

      await Future.delayed(Duration(seconds: 0));
      emit(NewsCategoryFetchState(categorieList: categoryList));
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
