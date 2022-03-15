part of 'saved_articles_bloc.dart';

@immutable
abstract class SavedArticlesEvent extends Equatable {}

class GetSavedArticles extends SavedArticlesEvent {
  final List<ArticleModel> articles;
  GetSavedArticles({this.articles = const <ArticleModel>[]});

  @override
  List<Object> get props => [articles];
}

class SaveArticle extends SavedArticlesEvent {
  final ArticleModel article;
  SaveArticle({required this.article});

  @override
  List<Object> get props => [article];
}

class DeleteSavedArticle extends SavedArticlesEvent {
  final String articleId;
  DeleteSavedArticle({required this.articleId});

  @override
  List<Object> get props => [articleId];
}
