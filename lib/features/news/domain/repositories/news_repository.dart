import '../../data/models/news.dart';
import '../../data/local/news_database.dart';

class NewsRepository {
  final NewsDatabase _newsDatabase = NewsDatabase.instance;

  Future<List<News>> fetchNews() async {
    return await _newsDatabase.getAllNews();
  }

  Future<void> addNews(News news) async {
    await _newsDatabase.insertNews(news);
  }
}
