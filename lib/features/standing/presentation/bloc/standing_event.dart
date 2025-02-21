import 'standing_state.dart';

abstract class StandingsEvent {}

class LoadStandings extends StandingsEvent {}

class StandingsError extends StandingsState {
  final String message;
  StandingsError(this.message);
}
