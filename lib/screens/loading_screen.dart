import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http; //1

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

Location location = Location();

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    getLocation();
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  void getLocation() async {
    await location.getCurrentLocation();
    print(location.Latitude);
    print(location.Longitude);
  }

  void getData() async {
    //3
    //2
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?lat=19.0760&lon=72.8777&appid=ceccd92fce7afe5b9cc84b959f919696');
    print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      var longitude = jsonDecode(data)['coord']['lon'];

      var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      var cityName = jsonDecode(data)['name'];

      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Container();

//2
  }
}
