part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final String name;
  final int points;
  final String? imagePath;
  final String status;

  UpdateProfile({
    required this.name,
    required this.points,
    this.imagePath,
    required this.status,
  });
}
