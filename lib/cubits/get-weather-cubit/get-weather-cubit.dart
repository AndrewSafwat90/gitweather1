import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitweather1/cubits/get-weather-cubit/git-weather-states.dart';
import 'package:gitweather1/models/weathetmodel.dart';
import 'package:gitweather1/services/weatherservice.dart';
import 'package:gitweather1/views/searchview.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());

  getweather({required String cityName}) async {
    try {
      WeatherModel weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);

      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
