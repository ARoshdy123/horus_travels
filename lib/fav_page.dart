import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // For JSON encoding and decoding

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Map<String, dynamic>> favoritePlaces = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites(); // Load favorites from SharedPreferences
  }

  Future<void> _loadFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? favoritesData = prefs.getString('favoritePlaces');

    if (favoritesData != null) {

      setState(() {
        favoritePlaces = List<Map<String, dynamic>>.from(
          json.decode(favoritesData),
        );
      });
    }
  }

  Future<void> _updateFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Encode the updated list of favorite places into a JSON string
    await prefs.setString('favoritePlaces', json.encode(favoritePlaces));
  }

  void _removeFromFavorites(int index) {
    setState(() {
      favoritePlaces.removeAt(index);
    });
    _updateFavorites(); // Save the updated favorites list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favoritePlaces.isEmpty
          ? const Center(child: Text('No favorites added yet!'))
          : ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          var place = favoritePlaces[index];
          return Card(
            child: ListTile(
              title: Text(place['name']),
              subtitle: Text(place['description']),
              trailing: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () => _removeFromFavorites(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
