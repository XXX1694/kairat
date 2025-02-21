import 'package:flutter/material.dart';
import 'package:kairat/features/news/data/models/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            news.imageUrl,
            height: 200,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 200,
              width: double.infinity,
              color: Colors.white10,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            news.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Proxima Nova',
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          news.date,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Proxima Nova',
            color: Colors.white54,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: const SizedBox(height: 20),
        ),
      ],
    );
  }
}
