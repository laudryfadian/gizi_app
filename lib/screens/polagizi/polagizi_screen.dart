import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gizi_app/models/pola_gizi.dart';
import 'package:gizi_app/screens/polagizi/polagizi_detail_screen.dart';

class PolaGiziScreen extends StatefulWidget {
  const PolaGiziScreen({Key? key}) : super(key: key);

  @override
  State<PolaGiziScreen> createState() => _PolaGiziScreenState();
}

class _PolaGiziScreenState extends State<PolaGiziScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<PolaGizi>> fetchPolaGizi() async {
    final String res =
        await rootBundle.loadString("assets/datas/pola_gizi.json");
    var map = jsonDecode(res) as List<dynamic>;
    return map.map((e) => PolaGizi.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Pola Gizi"),
        actions: const [],
      ),
      body: FutureBuilder(
        future: fetchPolaGizi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            var items = snapshot.data as List<PolaGizi>;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PolaGiziDetailScreen(item: items[index])),
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
