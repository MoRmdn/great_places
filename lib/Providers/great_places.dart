import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/Helper/dp_helper.dart';
import 'package:great_places/Models/Place.dart';

class GreatPlaces with ChangeNotifier {
  int? _idCounter;
  // static SharedPreferences? _prefs;

  // static init() async => _prefs = await SharedPreferences.getInstance();

  int idCounterM() {
    if (_item.isNotEmpty) {
      final lastOne = _item.last;
      _idCounter = lastOne.id;
    }
    _idCounter ??= 0;
    _idCounter = _idCounter! + 1;
    // _prefs?.setInt('id', _idCounter!);
    return _idCounter!;
  }

  List<Place> _item = [];

  /// retrive item copy of item list
  List<Place> get item {
    return [..._item];
  }

  ///take image and place name and create instance of Place in the list
  Future<void> addPlace(
      File? image, String title, double lat, lng, String address) async {
    final newPlace = Place(
      id: idCounterM(),
      title: title,
      image: image!,
      location: LocData(
        latitude: lat,
        longitude: lng,
        address: address,
      ),
    );
    _item.add(newPlace);
    notifyListeners();
    DBhelper.insert('userPLaces', {
      'id': newPlace.id!,
      'title': newPlace.title!,
      'image': newPlace.image!.path,
      'lat': newPlace.location!.latitude,
      'lng': newPlace.location!.longitude,
      'address': newPlace.location!.address!,
    });
  }

  Future<void> fetchAndSetDataBase() async {
    final data = await DBhelper.getDataFromDataBase('userPLaces');
    _item = data
        .map(
          (e) => Place(
            id: e['id']!,
            title: e['title']!,
            image: File(e['image']!),
            location: LocData(
                latitude: e['lat'], longitude: e['lng'], address: e['address']),
          ),
        )
        .toList();

    notifyListeners();
  }
}
