part of 'articles_bloc.dart';

@immutable
abstract class ArticlesEvent extends Equatable {}

class GetSavedArticles extends ArticlesEvent {
  final List<ArticleModel> articles;
  GetSavedArticles({this.articles = const <ArticleModel>[]});

  @override
  List<Object> get props => [articles];
}

class SaveArticle extends ArticlesEvent {
  final ArticleModel article;
  SaveArticle({required this.article});

  @override
  List<Object> get props => [article];
}

class DeleteSavedArticle extends ArticlesEvent {
  final String articleId;
  DeleteSavedArticle({required this.articleId});

  @override
  List<Object> get props => [articleId];
}
