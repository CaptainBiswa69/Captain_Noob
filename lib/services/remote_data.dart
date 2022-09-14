import 'package:disaster_notifier/models/current_weather_forecast.dart';
import 'package:disaster_notifier/models/current_weather_open.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RemoteData {

  Future<CurrentWeatherOpen?> getCurrentWeatherOpen(String lat, String lon) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=${dotenv.env['OPENWEATHERKEY']}&units=metric');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return currentWeatherOpenFromJson(json);
    }
    return null;
  }
  Future<CurrentWeatherOpenForecast?> getCurrentWeatherOpenForecast(String lat, String lon) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=${dotenv.env['OPENWEATHERKEY']}&units=metric');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return currentWeatherOpenForecastFromJson(json);
    }
    return null;
  }
}
