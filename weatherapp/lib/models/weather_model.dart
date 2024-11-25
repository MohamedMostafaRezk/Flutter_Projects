import 'package:flutter/material.dart';

class WeatherModel {
  final dynamic cityname;
  final DateTime date;
  final dynamic temp;
  final dynamic maxtemp;
  final dynamic mintemp;
  final dynamic weathercondition;
  final String? image;

  WeatherModel({
    required this.cityname,
    required this.date,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.weathercondition,
    this.image,
  });

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      cityname: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weathercondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }

  MaterialColor getThemeColor() {
    if (weathercondition == 'Sunny' || weathercondition == 'Clear' ||  weathercondition == 'partly cloudy') {
      return Colors.orange;
    } else if (
        
        weathercondition == 'Blizzard' ||  weathercondition == 'Patchy snow possible'  ||  weathercondition == 'Patchy sleet possible' || weathercondition == 'Patchy freezing drizzle possible' || weathercondition == 'Blowing snow') {
      return Colors.blue;
    } else if (weathercondition == 'Freezing fog' || weathercondition == 'Fog' ||  weathercondition == 'Heavy Cloud' || weathercondition == 'Mist' || weathercondition == 'Fog') {
      return Colors.blueGrey;
    } else if (weathercondition == 'Patchy rain possible' ||
        weathercondition == 'Heavy Rain' ||
        weathercondition == 'Showers	') {
      return Colors.blue;
    } else if (weathercondition == 'Thundery outbreaks possible' || weathercondition == 'Moderate or heavy snow with thunder' || weathercondition == 'Patchy light snow with thunder'|| weathercondition == 'Moderate or heavy rain with thunder' || weathercondition == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
