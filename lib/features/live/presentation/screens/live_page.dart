import 'package:flutter/material.dart';

import '../../../../core/translations/translate.dart';
import '../widgets/live_card/live_card.dart';
import '../widgets/live_stream_youtube.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          translation(context).live,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LiveCard(),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  translation(context).live_stream,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(height: 24),
              LiveStreamYoutube(
                videoId: 'KUUOlCWLBis',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
