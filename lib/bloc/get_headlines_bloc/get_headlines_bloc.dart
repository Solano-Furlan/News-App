import 'package:bloc/bloc.dart';
import 'package:domain/article/article.entity.dart';
import 'package:domain/article/article.repository.dart';
import 'package:equatable/equatable.dart';

part 'get_headlines_event.dart';
part 'get_headlines_state.dart';

class GetHeadlinesBloc extends Bloc<GetHeadlinesEvent, GetHeadlinesState> {
  final ArticleRepository articlesRepo;
  GetHeadlinesBloc({required this.articlesRepo})
      : super(GetHeadlinesInitial()) {
    on<GetHeadlinesArticles>(_getHeadlines);
  }

  void _getHeadlines(
      GetHeadlinesArticles event, Emitter<GetHeadlinesState> emit) async {
    emit(GetHeadlinesLoading());
    try {
      final headlines = await articlesRepo.getTopHeadlines();
      emit(GetHeadlinesLoaded(healines: headlines));
    } catch (e) {
      emit(GetHeadlinesError());
    }
  }
}
