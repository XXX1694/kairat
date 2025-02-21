import 'package:shared_preferences/shared_preferences.dart';

class PenaltyRepository {
  static const String _attemptsKey = "penalty_attempts";
  static const String _lastPlayedDateKey = "last_played_date";

  Future<int> getAttempts() async {
    final prefs = await SharedPreferences.getInstance();
    final lastDate = prefs.getString(_lastPlayedDateKey);
    final today = DateTime.now().toIso8601String().split("T").first;

    if (lastDate != today) {
      await prefs.setInt(_attemptsKey, 5);
      await prefs.setString(_lastPlayedDateKey, today);
      return 5;
    }

    return prefs.getInt(_attemptsKey) ?? 5;
  }

  Future<void> useAttempt() async {
    final prefs = await SharedPreferences.getInstance();
    int currentAttempts = await getAttempts();

    if (currentAttempts > 0) {
      await prefs.setInt(_attemptsKey, currentAttempts - 1);
    }
  }
}
