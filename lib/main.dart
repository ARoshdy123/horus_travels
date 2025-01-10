import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'authentication/screens/login_screen.dart';
import 'authentication/screens/signup_screen.dart';
import 'main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  await Hive.openBox('placesBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Tourism App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 18, 32, 47),
      ),
      initialRoute: '/login',
      routes: {
        '/signup': (context) => const SignUpScreen(), ///Navigator.pushReplacementNamed(context, '/login');
        '/login': (context) => const LoginScreen(),
        '/main': (context) => MainScreen(),
      },
    );
  }
}
