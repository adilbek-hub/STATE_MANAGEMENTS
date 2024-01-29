import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_bloc/constants/api_key.dart';
import 'package:news_app_bloc/model.dart';

class NewsService {
  NewsService({required this.client});
  final http.Client client;

  Future<TopNews?> fetchNews() async {
    final response = await http.get(Uri.parse(ApiKey.api));
    if (response.statusCode == 200) {
      return TopNews.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    }
    return null;
  }
}

final serviceRepo = NewsService(client: http.Client());
