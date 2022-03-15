import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/bloc/get_headlines_bloc/get_headlines_bloc.dart';
import 'package:mockito/annotations.dart';
import 'headlines_bloc_test.mocks.dart';

@GenerateMocks([ArticleRepository])
void main() {
  final articleRepository = MockArticleRepository();
  final headlinesBloc = GetHeadlinesBloc(articlesRepo: articleRepository);

  group("Headlines Bloc", () {
    test("Get headlines event returns a list of articles", () async* {
      when(articleRepository.getTopHeadlines()).thenAnswer(
        (_) async => [
          ArticleModel(),
          ArticleModel(),
        ],
      );

      headlinesBloc.add(GetHeadlinesArticles());

      await expectLater(
        headlinesBloc,
        emitsInOrder([
          isA<GetHeadlinesLoading>(),
          isA<GetHeadlinesLoaded>(),
        ]),
      );
    });

    test("Get headlines returns a error", () async* {
      when(articleRepository.getTopHeadlines())
          .thenThrow(Exception("404 error"));

      headlinesBloc.add(GetHeadlinesArticles());

      await expectLater(
        headlinesBloc,
        emitsInOrder([
          isA<GetHeadlinesLoading>(),
          isA<GetHeadlinesError>(),
        ]),
      );
    });
  });
}
