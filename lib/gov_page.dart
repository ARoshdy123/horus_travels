import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GovernmentsPage extends StatelessWidget {
  final List<String> governorates = ["Cairo", "Alexandria", "Luxor"];

   GovernmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Governorates')),
      body: ListView.builder(
        itemCount: governorates.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(governorates[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PlacesByGovernorate(governorate: governorates[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PlacesByGovernorate extends StatelessWidget {
  final String governorate;

  const PlacesByGovernorate({super.key, required this.governorate});

  @override
  Widget build(BuildContext context) {
    final Box placesBox = Hive.box('placesBox');
    var places = placesBox.values
        .where((place) => place['governorate'] == governorate)
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Places in $governorate')),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          var place = places[index];
          return Card(
            child: ListTile(
              title: Text(place['name']),
              subtitle: Text(place['description']),
            ),
          );
        },
      ),
    );
  }
}
