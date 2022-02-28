import "package:domain/domain.dart";

class ArticleRepoImpl extends ArticleRepository {
  final String baseUrl;
  ArticleRepoImpl({required this.baseUrl});

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
