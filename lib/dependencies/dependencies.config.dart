// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data/data.dart' as _i6;
import 'package:dio/dio.dart' as _i3;
import 'package:domain/domain.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:news_app/dependencies/backend.module.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final backendModule = _$BackendModule();
  gh.lazySingleton<_i3.Dio>(() => backendModule.dio());
  await gh.singletonAsync<_i4.FirebaseAuth>(() => backendModule.firebase(),
      preResolve: true);
  await gh.singletonAsync<_i5.RemoteConfigRepository>(
      () => backendModule.remoteConfigApi(),
      preResolve: true);
  gh.lazySingleton<_i5.AuthenticationRepository>(
      () => backendModule.authenticationApi(get<_i4.FirebaseAuth>()));
  gh.lazySingleton<_i6.Backend>(() =>
      backendModule.backend(get<_i3.Dio>(), get<_i5.RemoteConfigRepository>()));
  gh.lazySingleton<_i5.ArticleRepository>(
      () => backendModule.articlesApi(get<_i6.Backend>()));
  return get;
}

class _$BackendModule extends _i7.BackendModule {}
