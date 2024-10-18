class Article {
  final   int? id;
  final String? goal;
  final List<String>? tags;
  final String? title;
  final String? author;
  final String? content;
  final String? imageUrl;
  final String? publishedDate;
  Article({
    this.id,
    this.goal,
    this.tags,
    this.title,
    this.author,
    this.content,
    this.imageUrl,
    this.publishedDate,
  });



  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] != null ? map['id'] as int : null,
      goal: map['goal'] != null ? map['goal'] as String : null,
      tags: map['tags'] != null ? List<String>.from((map['tags'] as List<dynamic>)) : null,
      title: map['title'] != null ? map['title'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      imageUrl: map['image_url'] != null ? map['image_url'] as String : null,
      publishedDate: map['published_date'] != null ? map['published_date'] as String : null,
    );
  }

}
