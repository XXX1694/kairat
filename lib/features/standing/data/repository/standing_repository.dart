import '../models/player.dart';
import '../local/standing_database.dart';

class StandingsRepository {
  final PlayersDatabase _db = PlayersDatabase.instance;

  Future<List<Player>> getTopScorers() async {
    return await _db.getTopScorers(3);
  }

  Future<List<Player>> getTopAssists() async {
    return await _db.getTopAssists(3);
  }

  Future<List<Player>> getTopMiniGameOthers() async {
    return await _db.getTopMiniGame(3);
  }

  Future<void> seedSampleData() async {
    final db = PlayersDatabase.instance;
    final allScorers = await db.getTopScorers(10);
    if (allScorers.isEmpty) {
      await db.insertPlayer(Player(
        userName: "User_KZ",
        imageUrl: "assets/kazakhstan_flag.png",
        goals: 6,
        assists: 2,
        miniGamePoints: 3,
      ));
      await db.insertPlayer(Player(
        userName: "User_BR",
        imageUrl: "assets/brazil_flag.png",
        goals: 2,
        assists: 5,
        miniGamePoints: 1,
      ));
      await db.insertPlayer(Player(
        userName: "User_AR",
        imageUrl: "assets/argentina_flag.png",
        goals: 3,
        assists: 4,
        miniGamePoints: 2,
      ));
    }
  }
}
