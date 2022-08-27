import 'package:disaster_notifier/models/alerts.dart';
import 'package:disaster_notifier/models/current_weather.dart';
import 'package:disaster_notifier/models/location_id.dart';
import 'package:disaster_notifier/models/weather_forecast.dart';
import 'package:http/http.dart' as http;

class RemoteData {
  Future<CurrentWeather?> getCurrentWeather(String q) async {
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=26fffa4a7d004aca87c214552222308&q=$q&aqi=no');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return currentWeatherFromJson(json);
    }
    return null;
  }

  Future<WeatherForecast?> getWeatherForecast(String q) async {
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=26fffa4a7d004aca87c214552222308&q=$q&days=7&aqi=yes&alerts=yes');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return weatherForecastFromJson(json);
    }
    return null;
  }

  Future<LocationId?> getLocation(String q) async {
    var url = Uri.parse('https://api.predicthq.com/v1/places/?q=$q&limit=5');
    var response = await http.get(url, headers: {
      "Authorization": "Bearer hWeULtqIH5wlSzJNj-VFjkFzqjorItmUwlspQG8k"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return locationIdFromJson(json);
    }
    return null;
  }

  Future<Alert?> getAlert(
      double lat, double long, int id, String date, String end) async {
    var url = Uri.parse(
        'https://api.predicthq.com/v1/events?category=severe-weather&country=IN&end.lt=$end&location_around.origin=$lat%2C$long&place.scope=$id&start.gt=$date');
    var response = await http.get(url, headers: {
      "Authorization": "Bearer hWeULtqIH5wlSzJNj-VFjkFzqjorItmUwlspQG8k"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return alertFromJson(json);
    }
    return null;
  }
}
