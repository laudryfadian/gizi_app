// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class IndexMasaTubuhScreen extends StatefulWidget {
  const IndexMasaTubuhScreen({Key? key}) : super(key: key);

  @override
  State<IndexMasaTubuhScreen> createState() => _IndexMasaTubuhScreenState();
}

class _IndexMasaTubuhScreenState extends State<IndexMasaTubuhScreen> {
  TextEditingController tinggiController = TextEditingController();
  TextEditingController beratController = TextEditingController();
  String hasil = "";
  String keterangan = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("IMT - Bayi 1 sampai 12 bulan"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: tinggiController,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Tinggi badan',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "Tb *Cm",
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: beratController,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Berat badan',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "Berat *Kg",
                  ),
                  onChanged: (value) {},
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  hitungIMT();
                },
                child: Text("Hasil"),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Hasil IMT"), Text(hasil)],
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.topLeft,
                child: Text("Keterangan"),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(keterangan),
              ),
            ],
          ),
        ),
      ),
    );
  }

  hitungIMT() {
    if (tinggiController.text.isEmpty || beratController.text.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Form masih kosong"),
      ));
    } else {
      double tinggi = double.parse(tinggiController.text);
      double berat = double.parse(beratController.text);

      var toMeter = tinggi / 100;

      var result = berat / toMeter;

      print(result);
      if (result < 18.5) {
        setState(() {
          hasil = result.floor().toString();
          keterangan = "Berat badan kurang";
        });
      } else if (result < 22.9) {
        setState(() {
          hasil = result.ceil().toString();
          keterangan = "Berat badan normal";
        });
      } else if (result < 29.9) {
        setState(() {
          hasil = result.ceil().toString();
          keterangan = "Berat badan berlebih";
        });
      } else {
        setState(() {
          hasil = result.ceil().toString();
          keterangan = "Obesitas";
        });
      }
    }
  }
}
