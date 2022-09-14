import 'package:disaster_notifier/models/current_weather_forecast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart' as text;
import 'package:intl/intl.dart';

import '../services/remote_data.dart';

class Weather extends StatefulWidget {
  final double lat;
  final double lon;

  const Weather({
    Key? key,
    required this.lat,
    required this.lon,
  }) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String? img;
  int indexValue = 0;
  int? date;
  bool isLoaded = false;
  final RemoteData _remoteData = RemoteData();
  CurrentWeatherOpenForecast? _openWeatherforecast;
  @override
  void initState() {
    super.initState();
    getForecast(widget.lat, widget.lon);
  }

  getForecast(double lat, double lon) async {
    _openWeatherforecast = await _remoteData.getCurrentWeatherOpenForecast(
        lat.toString(), lon.toString());
    if (_openWeatherforecast != null) {
      isLoaded = true;
    }
    date = _openWeatherforecast?.list[0].dtTxt.day;
    setState(() {});
  }

  String getpng(String val) {
    if (val.length > 9) {
      String l = val[val.length - 1].toLowerCase();
      String f = val.substring(9, 11);
      return f + l;
    } else {
      return "04n";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const text.Text("Weather Forecaster"),
      ),
      body: isLoaded
          ? Column(children: [
              Card(
                elevation: 5,
                color: const Color(0xffB5B5B5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: text.Text(
                          _openWeatherforecast!.list[0].main.temp.toString(),
                          style: const TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Image.network(
                              "http://openweathermap.org/img/w/${getpng((_openWeatherforecast?.list[0].weather[0].icon).toString())}.png",
                              height: 100,
                              width: 100,
                              scale: 0.1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: text.Text(
                                "${_openWeatherforecast!.list[0].main.temp.toString()} \u2070C",
                                style: const TextStyle(fontSize: 40),
                              )),
                        )
                      ],
                    ),
                    weatherdata(
                        "Humidity",
                        _openWeatherforecast!.list[0].main.humidity.toString(),
                        "%"),
                    const SizedBox(
                      height: 10,
                    ),
                    weatherdata(
                        "Pressure",
                        _openWeatherforecast!.list[0].main.pressure.toString(),
                        "hPa"),
                    const SizedBox(
                      height: 10,
                    ),
                    weatherdata(
                        "Wind Speed",
                        _openWeatherforecast!.list[0].wind.speed.toString(),
                        "Km"),
                    const SizedBox(
                      height: 10,
                    ),
                    weatherdata(
                        "Visibility",
                        _openWeatherforecast!.list[0].visibility.toString(),
                        "m"),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _openWeatherforecast!.list.length,
                    itemBuilder: (context, index) {
                      if (date == _openWeatherforecast?.list[index].dtTxt.day) {
                        date = date! + 1;
                        return GestureDetector(
                          onTap: (() => setState(() {
                                indexValue = index;
                              })),
                          child: Card(
                            child: forecastWidget(index),
                          ),
                        );
                      } else if (date ==
                          _openWeatherforecast!.list[0].dtTxt.day + 5) {
                        date = _openWeatherforecast?.list[0].dtTxt.day;
                        return Container();
                      } else {
                        return Container();
                      }
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              details(indexValue)
            ])
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Padding forecastWidget(int index) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Image(
              image: NetworkImage(
                  "http://openweathermap.org/img/w/${getpng((_openWeatherforecast?.list[index].weather[0].icon).toString())}.png")),
          text.Text(
              "${_openWeatherforecast!.list[index].main.temp.toString()} \u2070C"),
          const SizedBox(
            height: 5,
          ),
          text.Text(" ${_openWeatherforecast!.list[index].dtTxt.day}")
        ],
      ),
    );
  }

  Widget weatherdata(String s, var value, var unit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Align(
          alignment: Alignment.topLeft,
          child: text.Text(
            "$s : $value $unit",
            style: const TextStyle(fontSize: 20),
          )),
    );
  }

  Widget details(int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Column(children: [
          const SizedBox(
            height: 5,
          ),
          text.Text(
            _openWeatherforecast!.list[index].weather[0].description.toString(),
            style: const TextStyle(fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "MaxTemp : ${_openWeatherforecast!.list[index].main.tempMax} \u2070C",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "MinTemp : ${_openWeatherforecast!.list[index].main.tempMin} \u2070C",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "Sea Level : ${_openWeatherforecast!.list[index].main.seaLevel}",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "MaxWind : ${_openWeatherforecast!.list[index].wind.speed} Kmph",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "Avg Visibility : ${_openWeatherforecast!.list[index].visibility} m",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "Avg Humidity: ${_openWeatherforecast!.list[index].main.humidity}%",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "Rain Volume in last 3hr: ${_openWeatherforecast!.list[index].rain?.the3H.toString()}",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ]),
      ),
    );
  }
}
