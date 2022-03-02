import 'package:flutter/material.dart';
import 'package:great_places/Helper/location_helper.dart';
import 'package:location/location.dart';

class LocationBuilder extends StatefulWidget {
  const LocationBuilder({Key? key}) : super(key: key);

  @override
  State<LocationBuilder> createState() => _LocationBuilderState();
}

class _LocationBuilderState extends State<LocationBuilder> {
  String? imagePreview;

  Future<void> getLocation() async {
    final myLocation = await Location().getLocation();
    final location = LocationHelper.generateImagePreview(
        altitude: myLocation.altitude!, longitude: myLocation.longitude!);

    setState(() {
      imagePreview = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          //padding: const EdgeInsets.fromLTRB(10, 2,),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: imagePreview == null
              ? const Text('No Location Picked Yet')
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imagePreview!,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
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
