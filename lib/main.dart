import 'package:flutter/material.dart';
import 'package:great_places/Providers/great_places.dart';
import 'package:great_places/Screens/add_place_screen.dart';
import 'package:great_places/Screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GreatPlaces())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.indigo,
          secondary: Colors.amber,
        ),
      ),

      // ThemeData(
      //   primarySwatch: Colors.blue,
      //     colorScheme.secondary:
      // ),
      home: FutureBuilder(
          // future: Provider.of<GreatPlaces>(
          //   context,
          // ).getStoredDataFromLocalStorage(),
          builder: (ctx, snapShotData) =>
              snapShotData.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const PlacesListScreen()),
      routes: {
        AddPlaceScreen.routeNamed: (ctx) => const AddPlaceScreen(),
      },
    );
  }
}
