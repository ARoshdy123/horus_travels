import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Box userBox = Hive.box('userBox');

  late String name;
  late String email;
  late String phone;

  @override
  void initState() {
    super.initState();
    name = userBox.get('firstName', defaultValue: "User");
    email = userBox.get('email', defaultValue: "user@example.com");
    phone = userBox.get('phone', defaultValue: "1234567890");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Name"),
              controller: TextEditingController(text: name),
              onChanged: (value) => name = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Email"),
              controller: TextEditingController(text: email),
              onChanged: (value) => email = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Phone"),
              controller: TextEditingController(text: phone),
              onChanged: (value) => phone = value,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Save"),
              onPressed: () {
                userBox.put('firstName', name);
                userBox.put('email', email);
                userBox.put('phone', phone);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profile updated!")));
              },
            ),
          ],
        ),
      ),
    );
  }
}
