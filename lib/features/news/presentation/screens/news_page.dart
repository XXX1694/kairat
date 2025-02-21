import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/constants.dart';
import '../../../../core/translations/translate.dart';
import '../../data/local/news_database.dart';
import '../../domain/repositories/news_repository.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_event.dart';
import '../bloc/news_state.dart';
import '../widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          translation(context).news,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocProvider(
          create: (context) => NewsBloc(NewsRepository())..add(LoadNews()),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is NewsLoaded) {
                return ListView.builder(
                  itemCount: state.newsList.length,
                  itemBuilder: (context, index) {
                    return NewsCard(news: state.newsList[index]);
                  },
                );
              } else if (state is NewsError) {
                return Center(child: Text(state.message));
              }
              return Center(child: Text('No news!'));
            },
          ),
        ),
      ),
    );
  }
}

Future<void> seedDatabase() async {
  final db = NewsDatabase.instance;
  final existingNews = await db.getAllNews();

  if (existingNews.isEmpty) {
    for (var news in sampleNews) {
      await db.insertNews(news);
    }
  }
}
