// To parse this JSON data, do
//
//     final newResponse = newResponseFromJson(jsonString);

import 'dart:convert';

NewResponse newResponseFromJson(String str) =>
    NewResponse.fromJson(json.decode(str));

String newResponseToJson(NewResponse data) => json.encode(data.toJson());

class NewResponse {
  NewResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory NewResponse.fromJson(Map<String, dynamic> json) => NewResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"]?? null,
        title: json["title"],
        description: json["description"] ?? null,
        url: json["url"],
        urlToImage: json["urlToImage"] ?? null,
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author ?? null,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage ?? null,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content ?? null,
      };
}

class Source {
  Source({
    this.id,
    required this.name,
  });

  dynamic id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
