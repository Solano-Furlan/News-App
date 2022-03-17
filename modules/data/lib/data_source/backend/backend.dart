import 'package:dio/dio.dart';

class Backend {
  final String newsApiUrl;
  final String newsApiKey;
  final Dio dioClient;
  Backend({
    required this.newsApiUrl,
    required this.dioClient,
    required this.newsApiKey,
  }) {
    dioClient.options.baseUrl = newsApiUrl;
    dioClient.options.queryParameters = {"apiKey": newsApiKey};
  }

  Future getHeadlines() async {
    return dioClient.get("/top-headlines?country=us");
  }
}
