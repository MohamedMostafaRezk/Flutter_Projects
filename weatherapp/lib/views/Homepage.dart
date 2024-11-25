// ignore_for_file: file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Provider/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapp/Provider/get_weather_cubit/get_weather_states.dart';
//import 'package:weatherapp/cubits/get_weather_cubit/get_weather_cubit.dart';
//import 'package:weatherapp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/views/searchview.dart';
import 'package:weatherapp/widgets/Noweather.dart';
import 'package:weatherapp/widgets/Weatherfind.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.blue,
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const Searchview();
                  },
                ),
              );
            },
          ),
        ],
      ),
      // 5- integrate cubit
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const Noweather(); // here ther is no need for rebuild more thean one duto const
          } else if (state is WeatherLoadedState) {
            return Weatherfind(
              weather: state
                  .weatherModel, // here we remove const to make rebuild morethan one time
            );
          } else {
            return const Center(
              child: Text(
                'Opps there was an error',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            );
          }
        },
      ),
      //body: const Noweather(),
    );
  }
}

// create states
// create cubit
// create function
// provide cubit
// integrate cubit
// trigger cubit
