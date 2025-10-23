import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:killqwerty_flutter/data/data_sourses/interactor/news_interactor.dart';
import 'package:killqwerty_flutter/data/models/news_item.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsInteractor interactor;

  NewsBloc({required this.interactor}) : super(NewsState()) {
    on<NewsInitEvent>((event, emit) async{
      await _init(event, emit);
    });
    on<LoadMore>((event, emit) {});
  }


  Future<void> _init(NewsInitEvent event, Emitter<NewsState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      var news = await interactor.getNews();
      emit(state.copyWith(list: news, isLoading: false));
    } catch(e) {
      print('Error in NewsBloc: $e');
      emit(state.copyWith(list: const [], isLoading: false));
    }
  }

}
