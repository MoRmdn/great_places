import 'dart:io';

import 'package:flutter/foundation.dart';

class LocationData{
  final double latitude; // in the constructor make it required so no need to put "?" .... required make it can't be null
  final double longitude;
  final String? address; // i didn't add required in constructor so i need to add "?" after type to make it as can be null
  LocationData({
    required this.latitude,
    required this.longitude,
    this.address,
});
}

class Place {
  final String title;
  final double id;
  final File image;
  final LocationData location;
  Place({
    required this.title,
    required this.id,
    required this.image,
    required this.location,
  });
}