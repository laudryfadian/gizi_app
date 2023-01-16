import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gizi_app/models/menu.dart';
import 'package:gizi_app/models/pola_gizi.dart';
import 'package:gizi_app/screens/distribusi/distribusi_screen.dart';
import 'package:gizi_app/screens/donasi/donasi_screen.dart';
import 'package:gizi_app/screens/imt/imt.dart';
import 'package:gizi_app/screens/polagizi/polagizi_screen.dart';
import 'package:gizi_app/screens/polagizi/select_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String momName = "";
  @override
  void initState() {
    fetchMom();
    super.initState();
  }

  Future<List<Menus>> fetchMenus() async {
    final String res = await rootBundle.loadString("assets/datas/menus.json");
    var map = jsonDecode(res) as List<dynamic>;
    return map.map((e) => Menus.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Gizi App"),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: fetchMenus(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            } else {
              var items = snapshot.data as List<Menus>;
              return Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: double.infinity,
                    child: Text(
                      "Selamat Datang",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                    ),
                    itemCount: items.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                items[index].imageUrl,
                                height: 100,
                              ),
                              Text(items[index].title),
                            ],
                          ),
                        ),
                        onTap: () {
                          var value = items[index].url;
                          switch (value) {
                            case "polagizi":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SelectScreen()),
                              );
                              break;
                            case "imt":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const IndexMasaTubuhScreen()),
                              );
                              break;
                            case "donasi":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DonasiScreen()),
                              );
                              break;
                            case "distribusi":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DistribusiScreen()),
                              );
                              break;
                            default:
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Tidak ada state $value"),
                              ));
                          }
                        },
                      );
                    },
                  ),
                ],
              );
            }
          },
        ));
  }

  fetchMom() async {
    final prefs = await SharedPreferences.getInstance();

    var name = prefs.getString('momName');

    setState(() {
      momName = name.toString();
    });
  }
}
