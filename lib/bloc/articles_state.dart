part of 'articles_bloc.dart';

@immutable
abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoading extends ArticlesState {}

class SavedArticlesLoaded extends ArticlesState {
  final List<ArticleModel> savedArticles;

  const SavedArticlesLoaded({this.savedArticles = const <ArticleModel>[]});

  @override
  List<Object> get props => [savedArticles];
}
