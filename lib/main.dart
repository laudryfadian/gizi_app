import 'package:flutter/material.dart';
import 'package:gizi_app/screens/baby/baby.dart';
import 'package:gizi_app/screens/home/home.dart';
import 'package:gizi_app/screens/mom/mom.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: firstScreen(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return const HomeScreen();
          } else {
            return const InitialMomScreen();
          }
        },
      ),
    );
  }

  Future<bool> firstScreen() async {
    final prefs = await SharedPreferences.getInstance();

    final String? momName = prefs.getString('momName');

    if (momName == null) {
      return false;
    } else {
      return true;
    }
  }
}
