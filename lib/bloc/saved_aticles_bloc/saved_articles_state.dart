part of 'saved_articles_bloc.dart';

@immutable
abstract class SavedArticlesState extends Equatable {
  const SavedArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesInitial extends SavedArticlesState {}

class ArticlesLoading extends SavedArticlesState {}

class SavedArticlesLoaded extends SavedArticlesState {
  final List<ArticleModel> savedArticles;

  const SavedArticlesLoaded({this.savedArticles = const <ArticleModel>[]});

  @override
  List<Object> get props => [savedArticles];
}
