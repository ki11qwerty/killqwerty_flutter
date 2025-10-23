import 'package:killqwerty_flutter/core/network/dio_news_client.dart';
import 'package:killqwerty_flutter/core/network/news_response.dart';
import 'package:killqwerty_flutter/data/models/news_item.dart';
import 'package:killqwerty_flutter/domain/repositories/news/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final DioNewsClient dio;
  NewsRepositoryImpl({required this.dio});

  @override
  Future<List<NewsItem>> getItems() async {
    try {
      var response = await dio.get(
        "/top-headlines",
        queryParameters: {
          'sortBy': 'popularity',
          'country': 'us',
        },
      );
      final newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse.articles
          .map((article) => NewsItem.fromArticle(article))
          .toList();
    } catch (e) {
      print('Error fetching news: $e');
      return [];
    }
  }

  // var response = await dio.get(
  // "/everything",
  // queryParameters: {
  // 'from': '2025-10-01',
  // 'sortBy': 'popularity',
  // 'q': 'apple',
  // },
  // );
}