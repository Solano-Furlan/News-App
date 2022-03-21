import 'package:data/repositories/authentication_repo_impl.dart';
import 'package:data/repositories/remote_config_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:data/data.dart';

@module
abstract class BackendModule {
  @singleton
  @preResolve
  Future<FirebaseAuth> firebase() async {
    final firebaseAuth = FirebaseAuth.instance;
    return firebaseAuth;
  }

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
  AuthenticationRepository authenticationApi(FirebaseAuth firebaseAuth) =>
      AuthenticationRepoImpl(firebaseAuth: firebaseAuth);

  @lazySingleton
  ArticleRepository articlesApi(Backend backend) =>
      ArticleRepoImpl(backend: backend);
}
