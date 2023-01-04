import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gizi_app/screens/mom/mom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialBabyScreen extends StatefulWidget {
  const InitialBabyScreen({Key? key}) : super(key: key);

  @override
  State<InitialBabyScreen> createState() => _InitialBabyScreenState();
}

class _InitialBabyScreenState extends State<InitialBabyScreen> {
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

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
                  "assets/baby.png",
                  height: MediaQuery.of(context).size.height * 0.45,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Baby Name",
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      prefixIcon: Icon(
                        Icons.child_care,
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
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: TextFormField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      hintText: "Age",
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      prefixIcon: Icon(
                        Icons.brightness_high,
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
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Select Your Gender',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value.toString();
                      });
                    },
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
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        selectedValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Form masih kosong"),
      ));
    } else {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('babyName', nameController.text);
      await prefs.setString('babyAge', ageController.text);
      await prefs.setString('babyGender', selectedValue.toString());

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InitialMomScreen()),
      );
    }
  }
}
