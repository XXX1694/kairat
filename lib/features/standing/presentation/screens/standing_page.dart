import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kairat/core/theme/app_pallete.dart';
import '../../../../core/translations/translate.dart';
import '../../data/models/player.dart';
import '../../data/repository/standing_repository.dart';
import '../bloc/standing_bloc.dart';
import '../bloc/standing_event.dart';
import '../bloc/standing_state.dart';

class StandingsPage extends StatelessWidget {
  const StandingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StandingsBloc(StandingsRepository())..add(LoadStandings()),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            translation(context).standing,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        body: BlocBuilder<StandingsBloc, StandingsState>(
          builder: (context, state) {
            if (state is StandingsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is StandingsLoaded) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle("Top mini-game", context),
                    _miniGameList(state),
                    _sectionTitle("Top scorers", context),
                    _playersList(state.topScorers, isGoals: true),
                    _sectionTitle("Top assists", context),
                    _playersList(state.topAssists, isGoals: false),
                  ],
                ),
              );
            } else if (state is StandingsError) {
              return Center(
                  child: Text(state.message,
                      style: TextStyle(color: Colors.white)));
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SvgPicture.asset('assets/icons/right.svg'),
        ],
      ),
    );
  }

  Widget _miniGameList(StandingsLoaded state) {
    final userItem = _StandingsItem(
      imageUrl: "assets/kairat_jersey.png",
      userName: state.currentUserName,
      value: state.currentUserPoints,
      isDark: true,
    );

    final otherItems = state.miniGameOthers.mapIndexed((index, player) {
      return _StandingsItem(
        imageUrl: player.imageUrl,
        userName: player.userName,
        value: player.miniGamePoints,
        isDark: index.isEven,
      );
    }).toList();

    return Column(children: [userItem, ...otherItems]);
  }

  Widget _playersList(List<Player> players, {required bool isGoals}) {
    return Column(
      children: players.asMap().entries.map((entry) {
        final index = entry.key;
        final player = entry.value;
        final value = isGoals ? player.goals : player.assists;
        return _StandingsItem(
          imageUrl: player.imageUrl,
          userName: player.userName,
          value: value,
          isDark: index.isEven,
        );
      }).toList(),
    );
  }
}

class _StandingsItem extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final int value;
  final bool isDark;

  const _StandingsItem({
    required this.imageUrl,
    required this.userName,
    required this.value,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final background = isDark ? Colors.transparent : Colors.white10;

    return Container(
      color: background,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(imageUrl),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              userName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Proxima Nova',
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppPallete.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "$value",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Proxima Nova',
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension on Iterable {
  Iterable<E> mapIndexed<E>(E Function(int index, dynamic item) f) {
    var i = 0;
    return map((item) => f(i++, item));
  }
}
