import 'package:dio/dio.dart';

class Backend {
  final String backendUrl;
  final String apiKey;
  final Dio dioClient;
  Backend({
    required this.backendUrl,
    required this.dioClient,
    required this.apiKey,
  }) {
    dioClient.options.baseUrl = backendUrl;
    dioClient.options.queryParameters = {"apiKey": apiKey};
  }

  Future getHeadlines() async {
    final data = await dioClient.get("/top-headlines?country=us");
    return data;
  }
}
