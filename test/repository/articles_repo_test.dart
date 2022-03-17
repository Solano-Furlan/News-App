import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/article/article.entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late ArticleRepoImpl articlesRepo;
  group(
    "Articles Repository Test",
    () {
      setUp(() {
        dio = Dio();
        dioAdapter = DioAdapter(dio: dio);
        dio.httpClientAdapter = dioAdapter;
        articlesRepo = ArticleRepoImpl(
            backend: Backend(
          newsApiKey: "",
          newsApiUrl: "",
          dioClient: dio,
        ));
      });

      test('Get Headlines test', () async {
        dioAdapter.onGet(
          "/top-headlines?country=us",
          (request) => request
              .reply(200, BackendMockData.healinesDefaultResponse, headers: {
            'Content-Type': ['application/json; charset=utf-8']
          }),
        );

        final articlesList = await articlesRepo.getTopHeadlines();

        expect(articlesList.length, equals(2));
        expect(articlesList.first, isA<ArticleModel>());
        expect(articlesList.first.author, equals("Oliver Darcy, CNN Business"));
      });
    },
  );
}
