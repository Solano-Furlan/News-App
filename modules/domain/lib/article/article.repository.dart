import 'package:domain/article/article.filter.dart';
import 'package:domain/article/article.entity.dart';

abstract class ArticleRepository {
  Future<ArticleModel> getArticle({ArticleFilter? filter});
}
