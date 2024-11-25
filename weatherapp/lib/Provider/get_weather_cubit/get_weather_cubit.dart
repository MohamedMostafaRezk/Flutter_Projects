// ignore_for_file: non_constant_identifier_names, unused_local_variable, annotate_overrides, avoid_renaming_method_parameters, avoid_types_as_parameter_names, use_function_type_syntax_for_parameters

// 2- Create Cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Provider/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  // ممكن تستخدم ده عن انك تملي كلاسات كيوبت وتبعته كله
  WeatherModel? weathermodel;
// 3- Create Function
  void GetWeather({required String CityName}) async {
    try {
      weathermodel =
          await WeatherService().getCurrentWeatther(cityName: CityName);

      emit(WeatherLoadedState(weatherModel: weathermodel!));
    } catch (e) {
      emit(WeahterFailureState());
    }
  }
}
