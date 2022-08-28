import 'package:disaster_notifier/models/weather_forecast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart' as text;
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  final WeatherForecast weatherForecast;

  const Weather({Key? key, required this.weatherForecast}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String? img;
  int indexValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const text.Text("Weather Forecaster"),
      ),
      body: Column(children: [
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
                    widget.weatherForecast.location.name,
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
                      child: Image.asset(
                        "assets/weather/64x64/${daynight(widget.weatherForecast.current.isDay)}/${weathericonString(widget.weatherForecast.current.condition.icon)}",
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
                          "${widget.weatherForecast.current.tempC} \u2070C",
                          style: const TextStyle(fontSize: 40),
                        )),
                  )
                ],
              ),
              weatherdata(
                  "Humidity", widget.weatherForecast.current.humidity, "%"),
              const SizedBox(
                height: 10,
              ),
              weatherdata(
                  "Pressure", widget.weatherForecast.current.pressureMb, "hPa"),
              const SizedBox(
                height: 10,
              ),
              weatherdata(
                  "Wind Speed", widget.weatherForecast.current.windKph, "Km"),
              const SizedBox(
                height: 10,
              ),
              weatherdata(
                  "Visibility", widget.weatherForecast.current.visKm, "km"),
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
          child: Card(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.weatherForecast.forecast.forecastday.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        indexValue = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Image.asset(
                              "assets/weather/64x64/day/${(widget.weatherForecast.forecast.forecastday[index].day.condition.icon).substring(39, 42)}.png"),
                          text.Text(
                              "${widget.weatherForecast.forecast.forecastday[index].day.avgtempC.toString()} \u2070C"),
                          const SizedBox(
                            height: 5,
                          ),
                          text.Text(
                              " ${DateFormat("EEEE").format(widget.weatherForecast.forecast.forecastday[index].date)}  ${widget.weatherForecast.forecast.forecastday[index].date.day.toString()}")
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        details(indexValue)
      ]),
    );
  }

  String weathericonString(String z) {
    // if (z.substring(39, 42) == "day") {
    //   return "${z.substring(39, 42)}.png";
    // } else {
    //   return "${z.substring(41, 44)}.png";
    // }
    return "${z.substring(39, 42)}.png";
  }

  String get(String z) {
    return "${z.substring(39, 42)}.png";
  }

  String daynight(int v) {
    if (v == 0) {
      return "night";
    } else {
      return "day";
    }
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
            height: 15,
          ),
          text.Text(
            widget
                .weatherForecast.forecast.forecastday[index].day.condition.text
                .toString()
                .substring(5),
            style: const TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                text.Text(
                  "MaxTemp : ${widget.weatherForecast.forecast.forecastday[index].day.maxtempC.toString()} \u2070C",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "MinTemp : ${widget.weatherForecast.forecast.forecastday[index].day.mintempC.toString()} \u2070C",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "AvgTemp : ${widget.weatherForecast.forecast.forecastday[index].day.avgtempC.toString()} \u2070C",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "MaxWind : ${widget.weatherForecast.forecast.forecastday[index].day.maxwindKph.toString()} Kmph",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "Avg Visibility : ${widget.weatherForecast.forecast.forecastday[index].day.avgvisKm.toString()} Km",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "Avg Humidity: ${widget.weatherForecast.forecast.forecastday[index].day.avghumidity.toString()}%",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                text.Text(
                  "Chance Of Rain: ${widget.weatherForecast.forecast.forecastday[index].day.dailyChanceOfRain.toString()}/100",
                  style: const TextStyle(fontSize: 20),
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
