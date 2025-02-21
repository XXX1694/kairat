part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String name;
  final int points;
  final String? imagePath;
  final String status;

  ProfileLoaded(
    this.name,
    this.points,
    this.imagePath,
    this.status,
  );
}
