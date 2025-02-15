import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;

  NewsBloc(this.repository) : super(NewsInitial()) {
    on<LoadNews>((event, emit) async {
      emit(NewsLoading());
      try {
        final newsList = await repository.fetchNews();
        emit(NewsLoaded(newsList));
      } catch (e) {
        emit(NewsError('Ошибка загрузки новостей'));
      }
    });

    on<AddNews>((event, emit) async {
      await repository.addNews(event.news);
      add(LoadNews());
    });
  }
}
