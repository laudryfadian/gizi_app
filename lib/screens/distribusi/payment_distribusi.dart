// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class PaymentDistribusi extends StatelessWidget {
  const PaymentDistribusi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pembayaran"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Pembayaran Pengiriman",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Image.asset(
                  "assets/qr.jpg",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
