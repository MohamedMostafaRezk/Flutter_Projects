// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Provider/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/Provider/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/views/Homepage.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

// 4- Provide Cubit
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          // BlockBuilder make rebuild for the widget he is in
          builder: (context, state) {
            return const Materialapp();
          },
        );
      }),
    );
  }
}

class Materialapp extends StatelessWidget {
  const Materialapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weathermodel
            ?.weathercondition),
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  } else if (condition == 'Sunny' ||
      condition == 'Clear' ||
      condition == 'partly cloudy') {
    return Colors.orange;
  } else if (condition == 'Blizzard' ||
      condition == 'Patchy snow possible' ||
      condition == 'Patchy sleet possible' ||
      condition == 'Patchy freezing drizzle possible' ||
      condition == 'Blowing snow') {
    return Colors.blue;
  } else if (condition == 'Freezing fog' ||
      condition == 'Fog' ||
      condition == 'Heavy Cloud' ||
      condition == 'Mist' ||
      condition == 'Fog') {
    return Colors.blueGrey;
  } else if (condition == 'Patchy rain possible' ||
      condition == 'Heavy Rain' ||
      condition == 'Showers	') {
    return Colors.blue;
  } else if (condition == 'Thundery outbreaks possible' ||
      condition == 'Moderate or heavy snow with thunder' ||
      condition == 'Patchy light snow with thunder' ||
      condition == 'Moderate or heavy rain with thunder' ||
      condition == 'Patchy light rain with thunder') {
    return Colors.deepPurple;
  } else {
    return Colors.blue;
  }
}
