part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

class NewsInitEvent extends NewsEvent {}

class LoadMore extends NewsEvent {
  LoadMore();
}
