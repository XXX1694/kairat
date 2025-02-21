import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kairat/features/main_page.dart';
import 'package:kairat/features/mini-game/presentation/screens/mini_game_page.dart';
import 'package:kairat/features/news/presentation/screens/news_page.dart';
import 'package:kairat/features/penalty-game/presentation/screens/penalty_game_page.dart';
import 'package:kairat/features/profile/presentation/screens/profile_page.dart';
import 'package:kairat/features/standing/presentation/screens/standing_page.dart';

import '../../features/live/presentation/screens/live_page.dart';
import '../../features/welcome/presentation/screens/welcome_page.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'welcome',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/main',
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/main/mini-game',
      name: 'mini-game',
      builder: (context, state) => const MiniGamePage(),
    ),
    GoRoute(
      path: '/main/mini-game/penalty',
      name: 'penalty',
      builder: (context, state) => const PenaltyGamePage(),
    ),
    GoRoute(
      path: '/main/standing',
      name: 'standing',
      builder: (context, state) => const StandingsPage(),
    ),
    GoRoute(
      path: '/main/live',
      name: 'live',
      builder: (context, state) => const LivePage(),
    ),
    GoRoute(
      path: '/main/news',
      name: 'news',
      builder: (context, state) => const NewsPage(),
    ),
    GoRoute(
      path: '/main/profile',
      name: 'profile',
      builder: (context, state) => const ProfilePage(),
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('Not Found'),
    ),
  ),
);
