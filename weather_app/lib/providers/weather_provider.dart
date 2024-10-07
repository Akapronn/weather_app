import 'package:flutter/foundation.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? _weatherData;

  Map<String, dynamic>? get weatherData => _weatherData;

  Future<void> loadWeather(String city) async {
    _weatherData = await _weatherService.fetchWeather(city);
    notifyListeners();
  }
}
