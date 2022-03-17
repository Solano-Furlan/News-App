import 'package:data/repositories/remote_config_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:data/data.dart';

@module
abstract class BackendModule {
  @singleton
  @preResolve
  Future<RemoteConfigRepository> remoteConfigApi() async {
    final remoteConfigApi = RemoteConfigRepoImpl();
    await remoteConfigApi.setupRemoteConfig();

    return remoteConfigApi;
  }

  @lazySingleton
  Dio dio() => Dio();

  @lazySingleton
  Backend backend(Dio dio, RemoteConfigRepository remoteConfigApi) => Backend(
        newsApiUrl: remoteConfigApi.getNewsApiUrl(),
        newsApiKey: remoteConfigApi.getNewsApiKey(),
        dioClient: dio,
      );

  @lazySingleton
  ArticleRepository articlesApi(Backend backend) =>
      ArticleRepoImpl(backend: backend);
}
