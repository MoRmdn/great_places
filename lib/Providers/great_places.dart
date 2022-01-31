import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/Models/pleace.dart';
import 'package:provider/provider.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _item=[];

  List<Place> get item{
    return [..._item];
  }

  void addPlace(File? image ,String title ){
    final newPlace = Place(id:null,title: title,image: image!,location: null);
    _item.add(newPlace);
    notifyListeners();
  }

}