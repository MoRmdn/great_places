import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/Helper/location_helper.dart';
import 'package:great_places/Models/Place.dart';
import 'package:great_places/Providers/great_places.dart';
import 'package:great_places/Widget/image_preview.dart';
import 'package:great_places/Widget/location.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);
  static const routeNamed = '/AddPLaceScreen';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  File? _storedImage;
  final TextEditingController? _titleController = TextEditingController();
  LocData? addressData;

  void _image(File? image) {
    /// i will get it from anther page
    _storedImage = image;
  }

  void _location(double lat, lng) async {
    final _address = await LocationHelper.getAddress(lat, lng);
    addressData = LocData(latitude: lat, longitude: lng, address: _address);
  }

  void _onSave() {
    if (_storedImage == null ||
        _titleController?.text == null ||
        addressData == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _storedImage,
      _titleController!.text,
      addressData!.latitude,
      addressData!.longitude,
      addressData!.address!,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            // <-- SEE HERE
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          context: context,
          builder: (BuildContext ctx) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: "Place Name",
                            ),
                            controller: _titleController,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ImagePreview(_image),
                        const SizedBox(
                          height: 10,
                        ),
                        LocationBuilder(_location),
                      ],
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _onSave,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Place'),
                ),
              ],
            );
          }),
      icon: const Icon(
        Icons.add,
      ),
    );
  }
}
