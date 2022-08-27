import 'package:badges/badges.dart';
import 'package:disaster_notifier/models/current_weather.dart';
import 'package:disaster_notifier/pages/weather.dart';
import 'package:disaster_notifier/services.dart/remote_data.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:geolocator/geolocator.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? subLocality;
  String? city;
  bool isCuWeatherLoaded = false;
  Position? _position;
  CurrentWeather? _weather;
  final RemoteData _remoteData = RemoteData();

  getCods() async {
    _position = await _determinePosition();
    setState(() {});
    getAddress(_position!).then((value) => getCurrentWeather(city!));
    setState(() {});
  }

  getCurrentWeather(String city) async {
    _weather = await _remoteData.getCurrentWeather(city);
    if (_weather != null) {
      setState(() {
        isCuWeatherLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Disaster Notifier", style: TextStyle(fontSize: 30)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Badge(
              badgeContent: const Text('10'),
              position: BadgePosition.topEnd(top: 5, end: 5),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    size: 25,
                  )),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.home,
          size: 30,
          color: Color(0xff403FFB),
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          elevation: 5,
          notchMargin: 12,
          color: const Color(0xffA29CF4),
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.help_center,
                        size: 30,
                        color: Color(0xffE5E3F1),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.info,
                        size: 30,
                        color: Color(0xffE5E3F1),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        launchUrlString('tel: +91 7008724191');
                      },
                      icon: const Icon(
                        Icons.call,
                        size: 30,
                        color: Color(0xffE5E3F1),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.map,
                        size: 30,
                        color: Color(0xffE5E3F1),
                      ))
                ],
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              color: Colors.amber,
              elevation: 5,
              child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_city_sharp),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Location : "),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                                "$subLocality, $city  ${_position?.latitude.toString() ?? " "}  ${_position?.longitude.toString() ?? " "}"),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: const Color(0xffE5E2F1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "${_weather?.current.tempC.toString()} \u2070",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 30,
                              ),
                            ),
                            Image(
                                image: AssetImage(
                                    "assets/weather/64x64/${daynight(_weather?.current.condition.icon ?? "//cdn.weatherapi.com/weather/64x64/day/143.png")}/${weathericonString(_weather?.current.condition.icon ?? "//cdn.weatherapi.com/weather/64x64/day/143.png")}"))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${_weather?.current.condition.text}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Feels Like: ${_weather?.current.feelslikeC} \u2070C",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Humidity: ${_weather?.current.humidity}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Clouds: ${_weather?.current.cloud}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: GestureDetector(
                      onTap: () {
                        if (city == null) {
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Weather(
                                    city: city!,
                                  )));
                        }
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: const Color(0xffA29CF4),
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, right: 15, left: 15, bottom: 10),
                              child: Icon(
                                Icons.sunny,
                                color: Color(0xff403FFB),
                                size: 50,
                              ),
                            ),
                            Text("Weather")
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      color: const Color(0xffA29CF4),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15, right: 15, left: 15, bottom: 10),
                            child: Icon(
                              Icons.satellite,
                              color: Color(0xff403FFB),
                              size: 50,
                            ),
                          ),
                          Text("Satellite Map")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      color: const Color(0xffA29CF4),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15, right: 15, left: 15, bottom: 10),
                            child: Icon(
                              Icons.near_me,
                              color: Color(0xff403FFB),
                              size: 50,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text("Nearby Safe Places"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      color: const Color(0xffA29CF4),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15, right: 15, left: 15, bottom: 10),
                            child: Icon(
                              Icons.search,
                              color: Color(0xff403FFB),
                              size: 50,
                            ),
                          ),
                          Text("Predictions")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const DosDont()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: const Color(0xffA29CF4),
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, right: 15, left: 15, bottom: 10),
                              child: Icon(
                                Icons.book,
                                color: Color(0xff403FFB),
                                size: 50,
                              ),
                            ),
                            Text("Do's / Don't")
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const SafetyTips()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: const Color(0xffA29CF4),
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15, right: 15, left: 15, bottom: 10),
                              child: Icon(
                                Icons.tips_and_updates,
                                color: Color(0xff403FFB),
                                size: 50,
                              ),
                            ),
                            Text("Safety Tips")
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddress(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    subLocality = placemarks[0].subLocality;
    city = placemarks[0].locality;
    setState(() {});
  }

  String weathericonString(String z) {
    return "${z.substring(39, 42)}.png";
  }

  String daynight(String z) {
    return z.substring(35, 38);
  }
}
