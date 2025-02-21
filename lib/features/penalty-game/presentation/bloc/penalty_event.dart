import 'package:kairat/features/penalty-game/presentation/bloc/penalty_bloc.dart';

abstract class PenaltyEvent {}

class LoadAttempts extends PenaltyEvent {}

class ShootBall extends PenaltyEvent {
  final ShotDirection direction;
  ShootBall(this.direction);
}
