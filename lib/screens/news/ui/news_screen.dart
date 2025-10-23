import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:killqwerty_flutter/di/injections.dart';
import 'package:killqwerty_flutter/screens/news/bloc/news_bloc.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsBloc(interactor: getIt())..add(NewsInitEvent()),
      child: Builder(builder: (context) => _news(context)),
    );
  }

  Widget _news(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: BlocSelector<NewsBloc, NewsState, NewsState>(
        selector: (state) => state,
        builder: (context, state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.list.isEmpty) {
            return Center(child: Text("No news available"));
          } else {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final newsItem = state.list[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: newsItem.urlToImage != null
                        ? Image.network(
                            newsItem.urlToImage!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.image_not_supported);
                            },
                          )
                        : Icon(Icons.article),
                    title: Text(
                      newsItem.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsItem.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${newsItem.sourceName} • ${_formatDate(newsItem.publishedAt)}',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Здесь можно добавить переход к полной статье
                      print('Tapped on: ${newsItem.title}');
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
