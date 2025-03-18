import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitweather1/cubits/get-weather-cubit/git-weather-states.dart';
import 'package:gitweather1/models/weathetmodel.dart';
import 'package:gitweather1/services/weatherservice.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  getweather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);

      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState(errorMessage: e.toString()));
    }
  }
}
