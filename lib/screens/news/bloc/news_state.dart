part of 'news_bloc.dart';

@immutable
class NewsState extends Equatable {
  final List<NewsItem> list;
  final bool isLoading;

  const NewsState({this.list = const [], this.isLoading = true});

  @override
  List<Object?> get props => [list, isLoading];

  NewsState copyWith({List<NewsItem>? list, bool? isLoading}) {
    return NewsState(list: list ?? this.list, isLoading: isLoading ?? this.isLoading);
  }
}
