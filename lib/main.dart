import 'package:flutter/material.dart';
import 'package:great_places/Providers/great_places.dart';
import 'package:great_places/Screens/add_place_screen.dart';
import 'package:great_places/Screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return ChangeNotifierProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
              primary: Colors.indigo,
              secondary: Colors.amber,),
        ),

        // ThemeData(
        //   primarySwatch: Colors.blue,
        //     colorScheme.secondary:
        // ),
        home: const PlacesListScreen(),
        routes:  {
          AddPlaceScreen.routeNamed:(ctx)=>  const AddPlaceScreen(),
        },
      ),
      create: (_)=> GreatPlaces(),

    );
  }
}


