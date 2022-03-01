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
    // dioClient.options.baseUrl = backendUrl;

    Future getHeadlines() async {
      final data = await dioClient.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=aa057f1293fa45889831b52637401949");
      return data;
    }
  }
}
