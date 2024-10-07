import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'weather_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> cities = ["Bangkok", "Khon Kaen", "Chiang Mai", "Phuket"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cities[index]),
            onTap: () {
              Provider.of<WeatherProvider>(context, listen: false)
                  .loadWeather(cities[index]);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeatherDetailScreen(city: cities[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

