import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitweather1/cubits/get-weather-cubit/get-weather-cubit.dart';
import 'package:gitweather1/cubits/get-weather-cubit/git-weather-states.dart';
import 'package:gitweather1/models/weathetmodel.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          var weatherModel =
              BlocProvider.of<GetWeatherCubit>(context).weatherModel;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    weatherModel.cityName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    weatherModel.date,
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          image:
                              NetworkImage('https://${weatherModel.image!}')),
                      Text(weatherModel.avgTemp.toString(),
                          style: TextStyle(fontSize: 30)),
                      Column(
                        children: [
                          Text('MaxTemp: ${weatherModel.maxTemp}'),
                          Text('MinTemp: ${weatherModel.minTemp}'),
                        ],
                      )
                    ],
                  ),
                  Text(
                    weatherModel.weatherCondition,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ],
              ),
            ),
          );
        } else if (state is WeatherFailureState) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
