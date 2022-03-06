import 'package:uuid/uuid.dart';

class ArticleModel {
  final String? id;
  final String? source;
  final String? author;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? title;
  final String? description;
  final String? content;

  ArticleModel({
    this.id,
    this.source,
    this.author,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.title,
    this.description,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> parsedJson) {
    var uuid = const Uuid();
    return ArticleModel(
      id: uuid.v4(),
      source: parsedJson['source']['name'].toString(),
      author: parsedJson['author'].toString(),
      url: parsedJson['url'].toString(),
      urlToImage: parsedJson['urlToImage'].toString(),
      publishedAt: DateTime.parse(parsedJson['publishedAt'].toString()),
      title: parsedJson['title'].toString(),
      description: parsedJson['description'].toString(),
      content: parsedJson['content'].toString(),
    );
  }
}
