part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

final class NewsFetchEvent extends NewsEvent {}
final class NewsCategoryFetchevent extends NewsEvent{
  final String category;

  NewsCategoryFetchevent({required this.category});
}
