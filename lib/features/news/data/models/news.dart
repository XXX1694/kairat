class News {
  final int? id;
  final String title;
  final String date;
  final String imageUrl;
  final String description;

  News({
    this.id,
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'imageUrl': imageUrl,
      'description': description,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'],
      title: map['title'],
      date: map['date'],
      imageUrl: map['imageUrl'],
      description: map['description'],
    );
  }
}
