import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/Models/Place.dart';

// ignore: must_be_immutable
class LocationScreen extends StatefulWidget {
  final LocationData? initialLocation;
  bool? isSelected;

  LocationScreen({
    Key? key,
    this.initialLocation = const LocationData(
      latitude: 37.422,
      longitude: -122.84,
    ),
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation!.latitude,
            widget.initialLocation!.longitude,
          ),
        ),
      ),
    );
  }
}
