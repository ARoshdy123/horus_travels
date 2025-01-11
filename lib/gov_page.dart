import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GovernmentsPage extends StatelessWidget {
  final List<String> governorates = ["Cairo", "Alexandria", "Luxor"];

   GovernmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Governorates')),
      body: ListView.builder(
        itemCount: governorates.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(governorates[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlacesByGovernorate(
                    governorate: governorates[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PlacesByGovernorate extends StatefulWidget {
  final String governorate;

  const PlacesByGovernorate({super.key, required this.governorate});

  @override
  _PlacesByGovernorateState createState() => _PlacesByGovernorateState();
}

class _PlacesByGovernorateState extends State<PlacesByGovernorate> {
  List<Map<String, dynamic>> places = [];

  @override
  void initState() {
    super.initState();
    _loadPlaces();
  }

  Future<void> _loadPlaces() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? placesData = prefs.getString('places');

    if (placesData != null) {
      final List<Map<String, dynamic>> allPlaces =
      List<Map<String, dynamic>>.from(json.decode(placesData));

      setState(() {
        places = allPlaces
            .where((place) => place['governorate'] == widget.governorate)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Places in ${widget.governorate}')),
      body: places.isEmpty
          ? const Center(child: Text('No places found!'))
          : ListView.builder(
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
