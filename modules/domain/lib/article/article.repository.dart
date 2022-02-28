import 'package:domain/article/article.filter.dart';
import 'package:domain/article/article.entity.dart';

abstract class ArticleRepository {
  Future<List<ArticleModel>> getArticlesWithFilters({ArticleFilter? filter});
  Future<List<ArticleModel>> getTopHeadlines({ArticleFilter? filter});
}
