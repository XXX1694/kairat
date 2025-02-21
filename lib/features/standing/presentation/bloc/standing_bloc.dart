import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/standing_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'standing_event.dart';
import 'standing_state.dart';

class StandingsBloc extends Bloc<StandingsEvent, StandingsState> {
  final StandingsRepository repository;

  StandingsBloc(this.repository) : super(StandingsLoading()) {
    on<LoadStandings>(_onLoadStandings);
  }

  Future<void> _onLoadStandings(
      LoadStandings event, Emitter<StandingsState> emit) async {
    emit(StandingsLoading());

    try {
      await repository.seedSampleData();

      final scorers = await repository.getTopScorers();
      final assists = await repository.getTopAssists();
      final miniGameOthers = await repository.getTopMiniGameOthers();

      final prefs = await SharedPreferences.getInstance();
      final currentUserName = prefs.getString('user_name') ?? "User_043855";
      final currentUserPoints = prefs.getInt('user_points') ?? 4;

      emit(StandingsLoaded(
        miniGameOthers: miniGameOthers,
        topScorers: scorers,
        topAssists: assists,
        currentUserName: currentUserName,
        currentUserPoints: currentUserPoints,
      ));
    } catch (e) {
      emit(StandingsError("Error on loading!"));
    }
  }
}
