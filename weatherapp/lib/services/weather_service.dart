import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apikey = '166a6e315fbc4305962210852241508';

  Future<WeatherModel> getCurrentWeatther({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apikey&q=$cityName&days=1');
      WeatherModel weathermodel = WeatherModel.fromjson(response.data);

      return weathermodel;
    } on DioException catch (e) {
      final String errormessage = e.response?.data['error']['message'] ??
          'oops there is an error, try later';
      throw Exception(errormessage);
    }
  }
}
