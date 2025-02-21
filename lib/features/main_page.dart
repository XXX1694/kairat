import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kairat/features/penalty-game/presentation/screens/penalty_game_page.dart';

import '../core/translations/translate.dart';
import 'live/presentation/screens/live_page.dart';
import 'news/presentation/screens/news_page.dart';
import 'profile/presentation/screens/profile_page.dart';
import 'standing/presentation/screens/standing_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final bottomNavIndexProvider = StateProvider((ref) => 2);

  Widget _buildNavItem({
    required Widget icon,
    required Widget activeIcon,
    required String label,
    required int index,
    required ref,
    required bool active,
  }) {
    return GestureDetector(
      onTap: () {
        ref.read(bottomNavIndexProvider.notifier).update((state) => index);
      },
      child: Container(
        color: Colors.transparent,
        width: 75,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            active ? activeIcon : icon,
            const SizedBox(height: 2),
            Text(
              label,
              style: active
                  ? Theme.of(context).textTheme.displaySmall
                  : Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white54,
                      ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final currentIndex = ref.watch(bottomNavIndexProvider);
          return IndexedStack(
            index: currentIndex,
            children: const [
              PenaltyGamePage(),
              StandingsPage(),
              LivePage(),
              NewsPage(),
              ProfilePage(),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          final currentIndex = ref.watch(bottomNavIndexProvider);
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(
                    icon: SvgPicture.asset(
                      'assets/icons/disabled_mini_game.svg',
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/icons/active_mini_game.svg',
                      height: 24,
                      width: 24,
                    ),
                    label: translation(context).mini_game,
                    index: 0,
                    ref: ref,
                    active: currentIndex == 0,
                  ),
                  _buildNavItem(
                    activeIcon: SvgPicture.asset(
                      'assets/icons/active_standing.svg',
                      height: 24,
                      width: 24,
                    ),
                    icon: SvgPicture.asset(
                      'assets/icons/disabled_standing.svg',
                    ),
                    label: translation(context).standing,
                    index: 1,
                    ref: ref,
                    active: currentIndex == 1,
                  ),
                  _buildNavItem(
                    activeIcon: SvgPicture.asset(
                      'assets/icons/active_live.svg',
                      height: 24,
                      width: 24,
                    ),
                    icon: SvgPicture.asset(
                      'assets/icons/disabled_live.svg',
                    ),
                    label: translation(context).live_stream,
                    index: 2,
                    ref: ref,
                    active: currentIndex == 2,
                  ),
                  _buildNavItem(
                    activeIcon: SvgPicture.asset(
                      'assets/icons/active_news.svg',
                      height: 24,
                      width: 24,
                    ),
                    icon: SvgPicture.asset(
                      'assets/icons/disabled_news.svg',
                    ),
                    label: translation(context).news,
                    index: 3,
                    ref: ref,
                    active: currentIndex == 3,
                  ),
                  _buildNavItem(
                    activeIcon: SvgPicture.asset(
                      'assets/icons/active_profile.svg',
                      height: 24,
                      width: 24,
                    ),
                    icon: SvgPicture.asset('assets/icons/disabled_profile.svg'),
                    label: translation(context).profile,
                    index: 4,
                    ref: ref,
                    active: currentIndex == 4,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
