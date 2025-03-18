import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitweather1/cubits/get-weather-cubit/get-weather-cubit.dart';
import 'package:gitweather1/cubits/get-weather-cubit/git-weather-states.dart';
import 'package:gitweather1/views/searchview.dart';
import 'package:gitweather1/widgets/noweatherbody.dart';
import 'package:gitweather1/widgets/weatherinfobody.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchView();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ))
        ],

        //backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody();
          } else {
            return Center(child: Text('There was No data 😥'));
          }
        },
      ),
    );
  }
}
