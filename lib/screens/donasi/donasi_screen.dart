import 'package:flutter/material.dart';

class DonasiScreen extends StatefulWidget {
  const DonasiScreen({Key? key}) : super(key: key);

  @override
  State<DonasiScreen> createState() => _DonasiScreenState();
}

class _DonasiScreenState extends State<DonasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Donasi"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Image.asset(
                  "assets/donate.png",
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "By donating, you will also be supporting yout own communnity and literaly saving lives with every pint donated",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "No Rekening 999999999999",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
