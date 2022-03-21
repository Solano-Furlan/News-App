part of 'saved_articles_bloc.dart';

@immutable
abstract class SavedArticlesEvent extends Equatable {}

class GetSavedArticles extends SavedArticlesEvent {
  final List<ArticleModel> articles;
  GetSavedArticles({this.articles = const <ArticleModel>[]});

  @override
  List<Object> get props => [articles];
}

class SaveArticleEvent extends SavedArticlesEvent {
  final ArticleModel article;
  SaveArticleEvent({required this.article});

  @override
  List<Object> get props => [article];
}

class DeleteSavedArticleEvent extends SavedArticlesEvent {
  final String articleId;
  DeleteSavedArticleEvent({required this.articleId});

  @override
  List<Object> get props => [articleId];
}
