import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'There is no weather 😌 Start',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Searching Now',
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
