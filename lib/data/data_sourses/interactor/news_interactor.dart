import 'package:killqwerty_flutter/data/models/news_item.dart';
import 'package:killqwerty_flutter/domain/repositories/news/news_repository.dart';

class NewsInteractor {
  NewsRepository repository;

  NewsInteractor({required this.repository});


  Future<List<NewsItem>> getNews() async {
    return repository.getItems();
  }
}