// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Provider/get_weather_cubit/get_weather_cubit.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        toolbarHeight: 70,
        backgroundColor: Colors.orange,
        title: const Text(
          'Search a City',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.GetWeather(CityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 16,
              ),
              labelText: 'Search',
              hintText: 'Enter city name',
              hintStyle: const TextStyle(
                color: Colors.cyan,
              ),
              //prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.search),
              suffixIconColor: Colors.cyan,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    const BorderSide(color: Colors.green), // do not work here
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(16),
              //   borderSide: const BorderSide(color: Colors.red),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(16),
              //   borderSide: const BorderSide(color: Colors.yellow),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
