import 'package:disaster_notifier/models/current_weather.dart';
import 'package:disaster_notifier/models/weather_forecast.dart';
import 'package:http/http.dart' as http;

class RemoteData {
  Future<CurrentWeather?> getCurrentWeather(String q) async {
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=26fffa4a7d004aca87c214552222308&q=$q&aqi=no');
    var response = await http.post(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return currentWeatherFromJson(json);
    }
    return null;
  }

  Future<WeatherForecast?> getWeatherForecast(String q) async {
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=26fffa4a7d004aca87c214552222308&q=$q&days=7&aqi=yes&alerts=yes');
    var response = await http.post(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return weatherForecastFromJson(json);
    }
    return null;
  }
}