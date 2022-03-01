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
    return [];
  }
}
