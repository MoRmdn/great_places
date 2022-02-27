import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/Helper/dp_helper.dart';
import 'package:great_places/Models/pleace.dart';
import 'package:provider/provider.dart';

class GreatPlaces with ChangeNotifier {
  double? _idCounter;
  double idCounterM() {
    _idCounter ??= 0;
    _idCounter = _idCounter! + 1;
    return _idCounter!;
  }

  final List<Place> _item = [];

  /// retrive item copy of item list
  List<Place> get item {
    return [..._item];
  }

  ///take image and place name and create instance of Place in the list
  void addPlace(File? image, String title) {
    final newPlace =
        Place(id: idCounterM(), title: title, image: image!, location: null);
    _item.add(newPlace);
    notifyListeners();
    DBhelper.insert('userPLaces', {
      'id': newPlace.id!,
      'title': newPlace.title!,
      'image': newPlace.image!.path,
    });
  }
}
