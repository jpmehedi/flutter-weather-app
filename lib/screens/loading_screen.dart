import 'package:flutter/material.dart';
import 'package:weather_app/services/networking.dart';
import '../services/location.dart';

double latitute;
double longitute;
const apiKey = '016ea41acccd45affefe7efd91a019d1';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();
    latitute = location.latitute;
    longitute = location.longitute;
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitute&lon=$longitute&appid=$apiKey");
    var weatherData = await networkHelper.getData();
    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
