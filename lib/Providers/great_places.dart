import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/Helper/dp_helper.dart';
import 'package:great_places/Models/pleace.dart';
import 'package:provider/provider.dart';

class GreatPlaces with ChangeNotifier{
  double _idCounter=0;
  double idCounterM(){
    return _idCounter++;
  }
  final List<Place> _item=[];

  List<Place> get item{
    return [..._item];
  }

  void addPlace(File? image ,String title ){
    final newPlace = Place(id:idCounterM(),title: title,image: image!,location: null);
    _item.add(newPlace);
    notifyListeners();
    DBhelper.insert('Places', {
      'id':newPlace.id!,
      'title':newPlace.title!,
      'image':newPlace.image!.path,
    });
  }

}