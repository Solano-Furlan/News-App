import 'package:bloc/bloc.dart';
import 'package:domain/article/article.entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc() : super(ArticlesInitial()) {
    on<GetSavedArticles>(_onGetSavedArticles);
    on<SaveArticle>(_onSaveArticle);
    on<DeleteSavedArticle>(_onDeleteSavedArticle);
  }

  void _onGetSavedArticles(
      GetSavedArticles event, Emitter<ArticlesState> emit) {
    emit(SavedArticlesLoaded(savedArticles: event.articles));
  }

  void _onSaveArticle(SaveArticle event, Emitter<ArticlesState> emit) {
    final state = this.state;
    if (state is SavedArticlesLoaded) {
      emit(
        SavedArticlesLoaded(
          savedArticles: List.from(state.savedArticles)..add(event.article),
        ),
      );
    }
  }

  void _onDeleteSavedArticle(
      DeleteSavedArticle event, Emitter<ArticlesState> emit) {
    final state = this.state;
    if (state is SavedArticlesLoaded) {
      emit(
        SavedArticlesLoaded(
          savedArticles: state.savedArticles
              .where((e) => e.id != event.articleId)
              .toList(),
        ),
      );
    }
  }
}
