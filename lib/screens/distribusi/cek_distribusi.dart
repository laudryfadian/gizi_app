// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gizi_app/screens/distribusi/payment_distribusi.dart';

class CekDistribusi extends StatefulWidget {
  const CekDistribusi({Key? key, required this.tujuan}) : super(key: key);
  final String tujuan;

  @override
  State<CekDistribusi> createState() => _CekDistribusiState();
}

class _CekDistribusiState extends State<CekDistribusi> {
  TextEditingController barangController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("distribusi"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: const Text(
                      "Tujuan",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text(
                    widget.tujuan,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  controller: barangController,
                  decoration: const InputDecoration(
                    labelText: 'Barang',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "Deskripsikan barang distribusi",
                  ),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  kirim(context);
                  // dialogKirim(context, barangController.text);
                },
                child: const Text("Bayar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  kirim(BuildContext context) {
    if (barangController.text.isEmpty) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Harap mengisi barang',
        btnCancelOnPress: () {},
        // btnOkOnPress: () {},
      ).show();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PaymentDistribusi(),
        ),
      );
    }
  }

  // dialogKirim(BuildContext context, String barang) {
  //   if (barang == null || barang == "") {
  //     AwesomeDialog(
  //       context: context,
  //       dialogType: DialogType.error,
  //       animType: AnimType.rightSlide,
  //       title: 'Input Gagal',
  //       btnCancelOnPress: () {},
  //       // btnOkOnPress: () {},
  //     ).show();
  //   } else {
  //     AwesomeDialog(
  //       context: context,
  //       dialogType: DialogType.success,
  //       animType: AnimType.rightSlide,
  //       title: 'Terima Kasih',
  //       desc: barang + " akan segera di proses",
  //       // btnCancelOnPress: () {},
  //       btnOkOnPress: () {},
  //     ).show();
  //   }
  // }
}
