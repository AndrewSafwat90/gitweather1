import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitweather1/cubits/get-weather-cubit/get-weather-cubit.dart';
import 'package:gitweather1/views/homeview.dart';

void main() {
  runApp(const GitWeather1());
}

class GitWeather1 extends StatelessWidget {
  const GitWeather1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: false,
              primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition),
            ),
            home: HomeView(),
          ),
        ));
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.lightBlue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;
    case 'patchy rain possible':
    case 'light drizzle':
    case 'light rain':
    case 'moderate rain':
    case 'heavy rain':
    case 'torrential rain shower':
      return Colors.blue;
    case 'patchy snow possible':
    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
    case 'blizzard':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.lightBlue;
    case 'patchy freezing drizzle possible':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.cyan;
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.teal;
    case 'blowing snow':
      return Colors.indigo;
    default:
      return Colors.blueGrey; // Default color for unlisted conditions
  }
}
