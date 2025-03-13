import 'package:dio/dio.dart';
import 'package:gitweather1/models/weathetmodel.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=6058a2c4090d42d0b45135146231605&q=$cityName&days=1');

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);

    return weatherModel;
  }
}
