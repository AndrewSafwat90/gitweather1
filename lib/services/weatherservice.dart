import 'package:dio/dio.dart';
import 'package:gitweather1/models/weathetmodel.dart';

class WeatherService {
  final Dio dio;
  final String basUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '6058a2c4090d42d0b45135146231605';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response response =
        await dio.get('$basUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);

    return weatherModel;
  }
}
