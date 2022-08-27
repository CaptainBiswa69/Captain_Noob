import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  final String city;
  const Weather({Key? key, required this.city}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Forcaster"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.city,
              style: const TextStyle(fontSize: 35),
            ),
          ),
        )
      ]),
    );
  }
}
