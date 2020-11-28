import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

Location location = Location();

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

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
    latitude = location.Latitude;
    longitude = location.Longitude;

    print(location.Latitude);
    print(location.Longitude);
    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=ceccd92fce7afe5b9cc84b959f919696');
    var weatherdata = await networkHelper.getData();

//  var weatherDescription = jsonDecode(data)['weather'][0]['description'];
//  var cityName = jsonDecode(data)['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Container();

//2
  }
}
