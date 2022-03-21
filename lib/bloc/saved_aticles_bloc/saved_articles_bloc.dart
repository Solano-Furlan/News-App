import 'package:bloc/bloc.dart';
import 'package:domain/article/article.entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'saved_articles_event.dart';
part 'saved_articles_state.dart';

class ArticlesBloc extends Bloc<SavedArticlesEvent, SavedArticlesState> {
  ArticlesBloc() : super(ArticlesInitial()) {
    on<GetSavedArticles>(_onGetSavedArticles);
    on<SaveArticleEvent>(_onSaveArticle);
    on<DeleteSavedArticleEvent>(_onDeleteSavedArticle);
  }

  void _onGetSavedArticles(
      GetSavedArticles event, Emitter<SavedArticlesState> emit) {
    emit(SavedArticlesLoaded(savedArticles: event.articles));
  }

  void _onSaveArticle(
      SaveArticleEvent event, Emitter<SavedArticlesState> emit) {
    final state = this.state;
    if (state is SavedArticlesLoaded) {
      emit(
        SavedArticlesLoaded(
          savedArticles: List.from(state.savedArticles)
            ..insert(0, event.article),
        ),
      );
    }
  }

  void _onDeleteSavedArticle(
      DeleteSavedArticleEvent event, Emitter<SavedArticlesState> emit) {
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
