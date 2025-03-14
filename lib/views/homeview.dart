import 'package:flutter/material.dart';
import 'package:gitweather1/views/searchview.dart';
import 'package:gitweather1/widgets/noweatherbody.dart';
import 'package:gitweather1/widgets/weatherinfobody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: NoWeatherBody(),
    );
  }
}
