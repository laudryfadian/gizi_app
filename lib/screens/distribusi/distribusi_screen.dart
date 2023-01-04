// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gizi_app/models/distribusi.dart';
import 'package:gizi_app/screens/distribusi/distribusi_detail_screen..dart';

class DistribusiScreen extends StatefulWidget {
  const DistribusiScreen({Key? key}) : super(key: key);

  @override
  State<DistribusiScreen> createState() => _DistribusiScreenState();
}

class _DistribusiScreenState extends State<DistribusiScreen> {
  Future<List<Distribusi>> fetchPolaGizi() async {
    final String res =
        await rootBundle.loadString("assets/datas/distribusi.json");
    var map = jsonDecode(res) as List<dynamic>;
    return map.map((e) => Distribusi.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Distribusi"),
        actions: const [],
      ),
      body: FutureBuilder(
        future: fetchPolaGizi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            var items = snapshot.data as List<Distribusi>;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index].city),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DistribusiDetailScreen(
                                item: items[index].district,
                                kecamatan: items[index].city,
                              )),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
