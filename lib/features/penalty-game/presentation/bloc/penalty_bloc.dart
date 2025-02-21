import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/penalty_repository.dart';
import 'penalty_event.dart';
import 'penalty_state.dart';

enum ShotDirection { topLeft, topCenter, topRight, left, bottomCenter, right }

class PenaltyBloc extends Bloc<PenaltyEvent, PenaltyState> {
  final PenaltyRepository repository;

  PenaltyBloc(this.repository) : super(PenaltyInitial()) {
    on<LoadAttempts>(_onLoadAttempts);
    on<ShootBall>(_onShootBall);
  }

  Future<void> _onLoadAttempts(
      LoadAttempts event, Emitter<PenaltyState> emit) async {
    final attempts = await repository.getAttempts();
    emit(PenaltyLoaded(attempts));
  }

  Future<void> _onShootBall(ShootBall event, Emitter<PenaltyState> emit) async {
    final attempts = await repository.getAttempts();
    if (attempts == 0) {
      emit(PenaltyLoaded(0));
      return;
    }

    final random = Random();
    final goalkeeperDirection = ShotDirection.values[random.nextInt(6)];
    final isGoal = event.direction != goalkeeperDirection;

    if (isGoal) {
      final prefs = await SharedPreferences.getInstance();
      final newPoints = prefs.getInt('user_points') ?? 0;
      await prefs.setInt('user_points', newPoints + 1);
    }

    await repository.useAttempt();
    final newAttempts = await repository.getAttempts();
    final isLastAttempt = newAttempts == 0;

    emit(PenaltyResult(
      isGoal: isGoal,
      shotDirection: event.direction,
      goalkeeperDirection: goalkeeperDirection,
      attemptsLeft: newAttempts,
      isLastAttempt: isLastAttempt,
    ));
  }
}
