import 'package:domain/domain.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigRepoImpl extends RemoteConfigRepository {
  late FirebaseRemoteConfig remoteConfig;

  @override
  Future<FirebaseRemoteConfig> setupRemoteConfig() async {
    remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: Duration.zero,
    ));
    await remoteConfig.setDefaults(<String, dynamic>{
      'news_api_key': 'aa057f1293fa45889831b52637401949',
      'news_api_url': 'https://newsapi.org/v2',
    });
    RemoteConfigValue(null, ValueSource.valueStatic);
    return remoteConfig;
  }

  @override
  getNewsApiKey() {
    return remoteConfig.getString('news_api_key');
  }

  @override
  getNewsApiUrl() {
    return remoteConfig.getString('news_api_url');
  }
}
