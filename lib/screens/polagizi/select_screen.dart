import 'package:flutter/material.dart';
import 'package:gizi_app/screens/polagizi/polagizi_dewasa_screen.dart';
import 'package:gizi_app/screens/polagizi/polagizi_screen.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Pilih"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListTile(
                title: const Text("Bayi"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PolaGiziScreen()),
                  );
                },
              ),
              ListTile(
                title: const Text("Dewasa"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PolaGiziDewasaScreen()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
