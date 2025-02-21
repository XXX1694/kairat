import '../../data/models/player.dart';

abstract class StandingsState {}

class StandingsLoading extends StandingsState {}

class StandingsLoaded extends StandingsState {
  final List<Player> miniGameOthers; // остальные игроки
  final List<Player> topScorers;
  final List<Player> topAssists;
  final String currentUserName;
  final int currentUserPoints;

  StandingsLoaded({
    required this.miniGameOthers,
    required this.topScorers,
    required this.topAssists,
    required this.currentUserName,
    required this.currentUserPoints,
  });
}
