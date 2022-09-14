import 'package:badges/badges.dart';
import 'package:disaster_notifier/models/current_weather_open.dart';
import 'package:disaster_notifier/pages/dos_dont.dart';
import 'package:disaster_notifier/pages/emergency.dart';
import 'package:disaster_notifier/pages/maps.dart';
import 'package:disaster_notifier/pages/pdf_view.dart';
import 'package:disaster_notifier/pages/safety_tips.dart';
import 'package:disaster_notifier/pages/satelite.dart';
import 'package:disaster_notifier/pages/sos_contact.dart';
import 'package:disaster_notifier/pages/weather.dart' as weather;
import 'package:disaster_notifier/services/remote_data.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon.dart' as ic;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? subLocality;
  String? city;
  double? lat;
  double? long;
  bool isCuWeatherLoaded = false;
  Position? _position;
  DateTime now = DateTime.now();
  String? id;
  bool isAlerts = false;
  final RemoteData _remoteData = RemoteData();
  CurrentWeatherOpen? _openWeather;
  String img = "143";
  String day = "day";
  List<String> rec = ["7008721914", "1990928662"];

  getCods() async {
    _position = await _determinePosition();
    setState(() {});
    getAddress(_position!).then((value) => getCurrentWeather(lat!, long!));
    setState(() {});
  }

  getCurrentWeather(double lat, double lon) async {
    _openWeather =
        await _remoteData.getCurrentWeatherOpen(lat.toString(), lon.toString());
    if (_openWeather != null) {
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
              badgeContent: const Text("10"),
              position: BadgePosition.topEnd(top: 5, end: 5),
              child: IconButton(
                  onPressed: () {},
                  icon: const ic.Icon(
                    Icons.notifications,
                    size: 25,
                  )),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const ic.Icon(
          Icons.home,
          size: 30,
          color: Color(0xff403FFB),
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: bottomNavBar(context),
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
                        const ic.Icon(Icons.location_city_sharp),
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
            currentWeatherBox(),
            const SizedBox(
              height: 20,
            ),
            tileRowOne(context),
            const SizedBox(
              height: 12,
            ),
            tileRow2(context),
            const SizedBox(
              height: 12,
            ),
            alertBox()
          ],
        ),
      ),
    );
  }

  Padding alertBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: const Color(0xffA8D1DF),
            elevation: 5,
            child: Column(
              children: const [
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "!! Important News !!",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 180,
                    child: Text("There is no alerts for your loclity for now"))
              ],
            )),
      ),
    );
  }

  Padding tileRow2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: GestureDetector(
              onTap: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Emergency()));
              }),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: const Color(0xffA29CF4),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 15, right: 15, left: 15, bottom: 10),
                      child: ic.Icon(
                        Icons.emergency,
                        color: Color(0xff403FFB),
                        size: 50,
                      ),
                    ),
                    Text("Emergency")
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const DosDont()));
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
                      child: ic.Icon(
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SafetyTips()));
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
                      child: ic.Icon(
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
    );
  }

  Padding tileRowOne(BuildContext context) {
    return Padding(
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
                      builder: (context) => weather.Weather(
                            lat: lat!,
                            lon: long!,
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
                      child: ic.Icon(
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
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SMaps(
                          lat: _position!.latitude,
                          long: _position!.longitude,
                        )));
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
                      child: ic.Icon(
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
          ),
          SizedBox(
            height: 120,
            width: 120,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Maps(
                          lat: _position!.latitude,
                          long: _position!.longitude,
                        )));
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
                      child: ic.Icon(
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
            ),
          )
        ],
      ),
    );
  }

  BottomAppBar bottomNavBar(BuildContext context) {
    return BottomAppBar(
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
                    onPressed: () {
                      _sendSMS("Help $lat $long", rec);
                    },
                    icon: const ic.Icon(
                      Icons.help_center,
                      size: 30,
                      color: Color(0xffE5E3F1),
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const PdfView(
                              pdfUrl:
                                  "https://firebasestorage.googleapis.com/v0/b/serv-b58fb.appspot.com/o/about_us%20(1).pdf?alt=media&token=28cf12a3-6a2e-42b0-9c59-5a174973ea0f"))));
                    },
                    icon: const ic.Icon(
                      Icons.info,
                      size: 30,
                      color: Color(0xffE5E3F1),
                    )),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      launchUrlString('tel: +91 011-26701728');
                    },
                    icon: const ic.Icon(
                      Icons.call,
                      size: 30,
                      color: Color(0xffE5E3F1),
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const Sos())));
                    },
                    icon: const ic.Icon(
                      Icons.add,
                      size: 30,
                      color: Color(0xffE5E3F1),
                    ))
              ],
            ),
          ),
        ));
  }

  Padding currentWeatherBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: const Color(0xffE5E2F1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "${_openWeather?.main.temp} \u2070C",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    _openWeather?.weather[0].icon != null
                        ? Image(
                            image: NetworkImage(
                                "http://openweathermap.org/img/w/${_openWeather?.weather[0].icon}.png"))
                        : Container()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${_openWeather?.weather[0].description}",
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
                    "Feels Like: ${_openWeather?.main.feelsLike} \u2070C",
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
                    "Humidity: ${_openWeather?.main.humidity}",
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
                    "Sealevel: ${_openWeather?.main.seaLevel}",
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
    lat = _position?.latitude;
    long = _position?.longitude;
    setState(() {});
  }

  Future<void> _sendSMS(String message, List<String> recipents) async {
    try {
      String _result = await sendSMS(
        message: "Hello",
        recipients: rec,
        sendDirect: true,
      );
    } catch (error) {}
  }
}
