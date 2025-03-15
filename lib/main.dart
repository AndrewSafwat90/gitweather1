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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
