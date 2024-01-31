import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_bloc/api_const.dart';
import 'package:weather_app_bloc/model.dart';

class WeatherService {
  Future<WeatherModel?> getData() async {
    final response = await http.get(Uri.parse(ApiConst.api));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return WeatherModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    }
    return null;
  }
}

final weatherService = WeatherService();
