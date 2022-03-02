import 'dart:io';

import 'package:flutter/foundation.dart';

class LocationData {
  final double
      latitude; // in the constructor make it required so no need to put "?" .... required make it can't be null
  final double longitude;
  final String?
      address; // i didn't add required in constructor so i need to add "?" after type to make it as can be null
  LocationData({
    required this.latitude,
    required this.longitude,
    this.address,
  });
}

class Place {
  final int? id;
  final String? title;
  final File? image;
  final LocationData? location;
  Place({
    required this.id,
    required this.title,
    required this.image,
    required this.location,
  });
}
