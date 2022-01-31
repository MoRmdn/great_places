import 'package:flutter/material.dart';
import 'package:great_places/Providers/great_places.dart';
import 'package:great_places/Screens/add_place_screen.dart';
import 'package:provider/provider.dart';


import '../Widget/image_preview.dart';


class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Great Places'),
        actions: [
         AddPlaceScreen(),
        ],
      ),
      body:  Center(
        child: Consumer<GreatPlaces>(
            child: Text('no data entered'),
            builder: (ctx,greatPlacesData,ch)=>ListView.builder(
                itemCount: greatPlacesData.item.length,
                itemBuilder: (BuildContext ctz,i)=>ListTile(
                  leading:Text('${greatPlacesData.item[i].title}') 
                  // CircleAvatar(backgroundImage: greatPlacesData.item[i].image,),
                ))),
      ),
    );
  }
}
