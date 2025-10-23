import 'dart:ffi';
import 'package:killqwerty_flutter/core/network/news_response.dart';

class NewsItem {
  final String id;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final String? author;
  final String sourceName;
  final DateTime publishedAt;
  final String? content;

  NewsItem({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    this.author,
    required this.sourceName,
    required this.publishedAt,
    this.content,
  });

  factory NewsItem.fromArticle(Article article) {
    return NewsItem(
      id: article.source.id ?? article.url, // Используем ID источника или URL как уникальный ID
      title: article.title,
      description: article.description,
      url: article.url,
      urlToImage: article.urlToImage,
      author: article.author,
      sourceName: article.source.name,
      publishedAt: article.publishedAt,
      content: article.content,
    );
  }
}