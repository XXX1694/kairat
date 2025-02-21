class Player {
  final int? id;
  final String userName;
  final String imageUrl;
  final int goals;
  final int assists;
  final int miniGamePoints;

  Player({
    this.id,
    required this.userName,
    required this.imageUrl,
    required this.goals,
    required this.assists,
    required this.miniGamePoints,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'imageUrl': imageUrl,
      'goals': goals,
      'assists': assists,
      'miniGamePoints': miniGamePoints,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'],
      userName: map['userName'],
      imageUrl: map['imageUrl'],
      goals: map['goals'],
      assists: map['assists'],
      miniGamePoints: map['miniGamePoints'],
    );
  }
}
