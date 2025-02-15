import '../../data/models/news.dart';

abstract class NewsEvent {}

class LoadNews extends NewsEvent {}

class AddNews extends NewsEvent {
  final News news;
  AddNews(this.news);
}
