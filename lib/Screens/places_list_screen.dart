import 'package:flutter/material.dart';
import 'package:great_places/Providers/great_places.dart';
import 'package:great_places/Screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Great Places'),
        actions: const [
          AddPlaceScreen(),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetDataBase(),
          builder: (ctx, snapShotData) => snapShotData.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<GreatPlaces>(
                  child: const Center(child: Text('no data entered')),
                  builder: (ctx, greatPlacesData, ch) => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                    ),
                    padding: const EdgeInsets.all(5),
                    itemCount: greatPlacesData.item.length,
                    itemBuilder: (BuildContext ctz, i) => greatPlacesData
                            .item.isEmpty
                        ? ch!
                        : GridTile(
                            child: Image.file(
                              greatPlacesData.item[i].image!,
                              fit: BoxFit.fill,
                            ),
                            footer: Container(
                                color: Colors.black45,
                                child: Center(
                                  child: Text(
                                    '${greatPlacesData.item[i].title}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ))
                            // CircleAvatar(backgroundImage: greatPlacesData.item[i].image,),
                            ),
                  ),
                ),
        ),
      ),
    );
  }
}
