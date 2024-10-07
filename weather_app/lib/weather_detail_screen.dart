import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherDetailScreen extends StatelessWidget {
  final String city;
  WeatherDetailScreen({required this.city});

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context).weatherData;

    if (weatherData == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(city),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(city),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'City: ${weatherData['name']}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text('Temperature: ${weatherData['main']['temp']} °C'),
            Text('Min Temp: ${weatherData['main']['temp_min']} °C'),
            Text('Max Temp: ${weatherData['main']['temp_max']} °C'),
            Text('Pressure: ${weatherData['main']['pressure']} hPa'),
            Text('Humidity: ${weatherData['main']['humidity']}%'),
            Text('Sea Level: ${weatherData['main']['sea_level'] ?? "N/A"}'),
            Text('Cloudiness: ${weatherData['clouds']['all']}%'),
            Text('Rain (last hour): ${weatherData['rain']?['1h'] ?? "No Rain"} mm'),
            Text('Sunset: ${DateTime.fromMillisecondsSinceEpoch(weatherData['sys']['sunset'] * 1000)}'),
            SizedBox(height: 20),
            Image.network(
              'https://openweathermap.org/img/wn/${weatherData['weather'][0]['icon']}@2x.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
