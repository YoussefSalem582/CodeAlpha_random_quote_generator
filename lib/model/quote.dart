class Quote {
  final String content;
  final String author;
  final String category;
  bool isFavorite;
  bool isRead;

  Quote({
    required this.content,
    required this.author,
    required this.category,
    this.isFavorite = false,
    this.isRead = false,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['content'],
      author: json['author'],
      category: json['tags'][0], // Assuming the first tag is the category
    );
  }
}