import '../repositories/news_repository.dart';
import '../../data/models/news.dart';

class GetNews {
  final NewsRepository repository;

  GetNews(this.repository);

  Future<List<News>> call() async {
    return await repository.fetchNews();
  }
}
