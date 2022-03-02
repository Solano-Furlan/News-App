import 'dart:convert';

import 'package:data/data.dart';
import "package:domain/domain.dart";

class ArticleRepoImpl extends ArticleRepository {
  final Backend backend;
  ArticleRepoImpl({required this.backend});

  @override
  Future<List<ArticleModel>> getArticlesWithFilters(
      {ArticleFilter? filter}) async {
    return [];
  }

  @override
  Future<List<ArticleModel>> getTopHeadlines({ArticleFilter? filter}) async {
    // final Map parsed = json.decode(res);
    final res = await backend.getHeadlines();
    var data = jsonDecode(res.toString());

    final articles = (data['articles'] as List)
        .map((data) => ArticleModel.fromJson(data))
        .toList();
    return articles;
  }
}
