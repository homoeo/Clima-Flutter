import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double Latitude;
  double Longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);

      Latitude = position.latitude;
      Longitude = position.longitude;
    } catch (e) {}
  }
}
