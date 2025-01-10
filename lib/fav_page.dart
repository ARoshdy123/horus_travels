
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Box placesBox = Hive.box('placesBox');
    var favoritePlaces = placesBox.values.where((place) => place['isFavorite']).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          var place = favoritePlaces[index];
          return Card(
            child: ListTile(
              title: Text(place['name']),
              subtitle: Text(place['description']),
              trailing: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  place['isFavorite'] = false;
                  placesBox.putAt(index, place);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
