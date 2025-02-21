import 'penalty_bloc.dart';

abstract class PenaltyState {}

class PenaltyInitial extends PenaltyState {}

class PenaltyLoaded extends PenaltyState {
  final int attemptsLeft;
  PenaltyLoaded(this.attemptsLeft);
}

class PenaltyResult extends PenaltyState {
  final bool isGoal;
  final ShotDirection shotDirection;
  final ShotDirection goalkeeperDirection;
  final int attemptsLeft;
  final bool isLastAttempt;

  PenaltyResult({
    required this.isGoal,
    required this.shotDirection,
    required this.goalkeeperDirection,
    required this.attemptsLeft,
    required this.isLastAttempt,
  });
}
