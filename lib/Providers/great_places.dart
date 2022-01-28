import 'package:flutter/material.dart';
import 'package:great_places/Models/pleace.dart';
import 'package:provider/provider.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _item=[];

  List<Place> get item{
    return [..._item];
  }
}