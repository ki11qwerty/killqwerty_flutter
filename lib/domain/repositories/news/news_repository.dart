import 'package:killqwerty_flutter/data/models/news_item.dart';

abstract class NewsRepository {
  Future<List<NewsItem>> getItems();
}