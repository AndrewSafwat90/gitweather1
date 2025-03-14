import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitweather1/cubits/get-weather-cubit/git-weather-states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit(initialState) : super(initialState);

getweather () {
weatherModel =
                await WeatherService(Dio()).getCurrentWeather(cityName: value);

}



}
