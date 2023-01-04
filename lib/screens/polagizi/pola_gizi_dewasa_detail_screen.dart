// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gizi_app/models/pola_gizi.dart';

class PolaGiziDewasaDetail extends StatelessWidget {
  const PolaGiziDewasaDetail({Key? key, required this.item}) : super(key: key);
  final PolaGizi item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 200,
                child: Image.asset(
                  item.asset,
                  height: MediaQuery.of(context).size.height * 0.45,
                ),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Deskripsi",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(item.description),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.topLeft,
                child: item.listDesc.isNotEmpty
                    ? Text(
                        "Pola makan ${item.title.toLowerCase()} ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Container(),
              ),
              SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: item.listDesc.length,
                    itemBuilder: (context, i) {
                      final product = item.listDesc[i];
                      return Text(" - $product");
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
