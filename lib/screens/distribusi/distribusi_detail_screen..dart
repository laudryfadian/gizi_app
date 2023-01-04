// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gizi_app/screens/distribusi/cek_distribusi.dart';

class DistribusiDetailScreen extends StatelessWidget {
  const DistribusiDetailScreen(
      {Key? key, required this.item, required this.kecamatan})
      : super(key: key);
  final String kecamatan;
  final List<String> item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(kecamatan),
          actions: const [],
        ),
        body: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(item[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CekDistribusi(
                      tujuan: item[index],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
