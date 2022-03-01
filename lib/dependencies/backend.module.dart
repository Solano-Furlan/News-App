import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:data/data.dart';

@module
abstract class BackendModule {
  // @singleton
  // @preResolve
  // Future<RemoteConfigService> remoteConfigService() async {
  //   var remoteConfigService = await RemoteConfigService.getInance();
  //   await remoteConfigService.initialise();
  //   return remoteConfigService;
  // }

  @lazySingleton
  Dio dio() => Dio();

  @lazySingleton
  Backend backend(Dio dio) => Backend(
        backendUrl: "https://newsapi.org/v2",
        apiKey: "aa057f1293fa45889831b52637401949",
        dioClient: dio,
      );

  @lazySingleton
  ArticleRepository articlesApi(Backend backend) =>
      ArticleRepoImpl(backend: backend);
}
