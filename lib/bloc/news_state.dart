part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLadingState extends NewsState {}

final class NewsSucessState extends NewsState {
  final List<ArticleModel?> latestnews;
  final List<ArticleModel?> hotList;

  NewsSucessState({required this.hotList, required this.latestnews});
}
final class NewsCategoryFetchState extends NewsState {
 final  List<ArticleModel?> categorieList;

  NewsCategoryFetchState({required this.categorieList});


}

final class NewsErrorState extends NewsState {
  final String errorMessage;

  NewsErrorState({required this.errorMessage});
}
