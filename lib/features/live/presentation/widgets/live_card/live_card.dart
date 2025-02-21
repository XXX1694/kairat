import 'package:flutter/material.dart';
import 'package:kairat/features/live/presentation/widgets/live_card/live_card_divider.dart';
import 'package:kairat/features/live/presentation/widgets/live_card/live_card_mid.dart';

import 'live_card_bottom.dart';
import 'live_card_top.dart';
import 'live_card_voater.dart';

class LiveCard extends StatelessWidget {
  const LiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          LiveCardTop(),
          const SizedBox(height: 32),
          LiveCardMid(),
          const SizedBox(height: 20),
          LiveCardDivider(),
          const SizedBox(height: 20),
          LiveCardVoater(),
          const SizedBox(height: 12),
          LiveCardBottom()
        ],
      ),
    );
  }
}
