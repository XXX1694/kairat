import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onLoadProfile(
      LoadProfile event, Emitter<ProfileState> emit) async {
    final prefs = await SharedPreferences.getInstance();

    final name = prefs.getString('user_name') ?? _generateRandomName();
    final points = prefs.getInt('user_points') ?? 0;
    final imagePath = prefs.getString('profile_image');
    final status = prefs.getString('fan_status') ?? "Фанат";

    emit(ProfileLoaded(name, points, imagePath, status));
  }

  Future<void> _onUpdateProfile(
      UpdateProfile event, Emitter<ProfileState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', event.name);
    await prefs.setInt('user_points', event.points);
    await prefs.setString('fan_status', event.status);
    if (event.imagePath != null) {
      await prefs.setString('profile_image', event.imagePath!);
    }

    emit(
        ProfileLoaded(event.name, event.points, event.imagePath, event.status));
  }

  String _generateRandomName() {
    final List<String> names = [
      "KairatFan ⚽️",
      "GoalHunter ⚽️",
      "YellowBlack ⚽️",
      "FootballKingR ⚽️"
    ];
    return names[(DateTime.now().millisecondsSinceEpoch % names.length)];
  }
}
