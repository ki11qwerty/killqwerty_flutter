import 'package:killqwerty_flutter/core/network/dio_news_client.dart';
import 'package:killqwerty_flutter/data/models/news_item.dart';
import 'package:killqwerty_flutter/domain/repositories/news/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository{
  final DioNewsClient dio;
  NewsRepositoryImpl({required this.dio});


  @override
  Future<List<NewsItem>> getItems() async {
    var response = await dio.get("/everything");
    return response.map((e) {
      final id = (e['id'] ?? '').toString();
      final title = (e['description'] ?? '').toString();
      return NewsItem(id: id, desk: title);
    }).toList();
  }
}