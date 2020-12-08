import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
  // here loadingscreen and loadingscreenstate are seperate classes.
}

Location location = Location();

class _LoadingScreenState extends State<LoadingScreen> {
  // double latitude;
  // double longitude;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getLocationData();
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  void getLocationData() async {
    await location.getCurrentLocation();
    // latitude = location.Latitude;
    // longitude = location.Longitude;
    var weatherdata = await WeatherModel().getLocationWeather();

    print(location.Latitude);
    print(location.Longitude);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherdata,
      );
    }));
//  var weatherDescription = jsonDecode(data)['weather'][0]['description'];
//  var cityName = jsonDecode(data)['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );

//2
  }
}
