// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Provider/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_model.dart';

class Weatherfind extends StatelessWidget {
  const Weatherfind({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weathermodel =
        BlocProvider.of<GetWeatherCubit>(context).weathermodel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weathermodel.weathercondition),
            getThemeColor(weathermodel.weathercondition)[300]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weathermodel.cityname,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            Text(
              'Updated at ${weathermodel.date.hour}:${weathermodel.date.minute}',
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network("https:${weathermodel.image}"),
                // if (weathermodel.temp > 30)
                //   Image.asset('assets/images/cloudy.png'),
                // if (weathermodel.temp > 10 && weathermodel.temp < 20)
                //   Image.asset('assets/images/clear.png'),
                // if (weathermodel.temp < 10 && weathermodel.temp > 0)
                //   Image.asset('assets/images/rainy.png'),
                // if (weathermodel.temp < 0) Image.asset('assets/images/snow.png'),
                // if (weathermodel.temp < 30 && weathermodel.temp > 20)
                //   Image.asset('assets/images/thunderstorm.png'),
                Text(
                  weathermodel.temp.toString(),
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'maxtemp: ${weathermodel.maxtemp}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'mintemp: ${weathermodel.mintemp.round()}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              weathermodel.weathercondition,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
