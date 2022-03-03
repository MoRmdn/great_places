import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/Helper/location_helper.dart';
import 'package:great_places/Screens/location_screen.dart';
import 'package:location/location.dart';

// ignore: must_be_immutable
class LocationBuilder extends StatefulWidget {
  Function? location;

  LocationBuilder(this.location, {Key? key}) : super(key: key);

  @override
  State<LocationBuilder> createState() => _LocationBuilderState();
}

class _LocationBuilderState extends State<LocationBuilder> {
  String? _imagePreview;

  void imagePreview(double lat, lng) {
    final location =
        LocationHelper.generateImagePreview(altitude: lat, longitude: lng);

    setState(() {
      _imagePreview = location;
    });
  }

  Future<void> getLocation() async {
    final myLocation = await Location().getLocation();
    imagePreview(myLocation.latitude!, myLocation.longitude);
    widget.location!(myLocation.latitude, myLocation.longitude);
  }

  Future<void> selectOnMap() async {
    final LatLng? selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => LocationScreen(
          isSelected: true,
        ),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    imagePreview(selectedLocation.latitude, selectedLocation.longitude);
    widget.location!(selectedLocation.latitude, selectedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: _imagePreview == null
              ? const Text('No Location Picked Yet')
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    _imagePreview!,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: selectOnMap,
              icon: const Icon(Icons.map),
              label: const Text('Pick Location'),
            ),
            ElevatedButton.icon(
              onPressed: getLocation,
              icon: const Icon(Icons.location_on_outlined),
              label: const Text('Locate Me'),
            )
          ],
        )
      ],
    );
  }
}
