import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kairat/core/translations/translate.dart';

class LiveCardMid extends StatefulWidget {
  const LiveCardMid({super.key});

  @override
  State<LiveCardMid> createState() => _LiveCardMidState();
}

class _LiveCardMidState extends State<LiveCardMid> {
  Duration _matchTime = const Duration(hours: 9, minutes: 13, seconds: 42);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _matchTime -= const Duration(seconds: 1);
        });
      }
    });
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(duration.inHours)}:${twoDigits(duration.inMinutes % 60)}:${twoDigits(duration.inSeconds % 60)}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/fc_kairat.png',
                height: 62,
                width: 62,
              ),
              Text(
                'FC Kairat',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                translation(context).home,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _formatTime(_matchTime),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Proxima Nova',
                    color: Colors.white,
                  ),
                ),
                const Text(
                  '6:30 PM',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Proxima Nova',
                    color: Colors.white54,
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/fc_astana.png',
                height: 62,
                width: 62,
              ),
              Text(
                'FC Astana',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                translation(context).away,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
