import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gizi_app/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialMomScreen extends StatefulWidget {
  const InitialMomScreen({Key? key}) : super(key: key);

  @override
  State<InitialMomScreen> createState() => _InitialMomScreenState();
}

class _InitialMomScreenState extends State<InitialMomScreen> {
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/mom.png",
                  height: MediaQuery.of(context).size.height * 0.45,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Mom Name",
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    save();
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  save() async {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Form masih kosong"),
      ));
    } else {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('momName', nameController.text);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    }
  }
}
