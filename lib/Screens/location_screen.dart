import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/Models/Place.dart';

// ignore: must_be_immutable
class LocationScreen extends StatefulWidget {
  final LocData? initialLocation;
  bool? isSelected;

  LocationScreen({
    Key? key,
    this.initialLocation = const LocData(
      latitude: 37.422,
      longitude: -122.84,
    ),
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LatLng? _pickedLocation;
  void selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Google Map'),
        actions: [
          IconButton(
              onPressed: _pickedLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedLocation);
                    },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation!.latitude,
            widget.initialLocation!.longitude,
          ),
          zoom: 16,
        ),
        onTap: widget.isSelected == false ? null : selectLocation,
        markers: _pickedLocation == null
            ? {}
            : {
                Marker(
                    markerId: const MarkerId('m1'), position: _pickedLocation!),
              },
      ),
    );
  }
}
