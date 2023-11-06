import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lottie/lottie.dart';

class NewScreen extends StatefulWidget {
  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  String textname = "";

  String numberph = "";

  String textstate = "";

  String textcountry = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Here"),
        backgroundColor: const Color.fromARGB(255, 128, 0, 128),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Lottie.asset("animations/new.json", height: 250),
              Padding(
                padding: const EdgeInsets.only(
                    left: 28.0, right: 28, top: 5, bottom: 5),
                child: TextField(
                  onChanged: (valuename) {
                    textname = valuename;
                  },
                  decoration: InputDecoration(hintText: "Enter Your Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 28.0, right: 28, top: 5, bottom: 5),
                child: TextField(
                  onChanged: (valueph) {
                    numberph = valueph;
                  },
                  decoration:
                      InputDecoration(hintText: "Enter Your Phone Number"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 28.0, right: 28, top: 5, bottom: 5),
                child: TextField(
                  onChanged: (valuestate) {
                    textstate = valuestate;
                  },
                  decoration: InputDecoration(hintText: "Enter Your State"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 28.0, right: 28, top: 5, bottom: 5),
                child: TextField(
                  onChanged: (valuecountry) {
                    textcountry = valuecountry;
                  },
                  decoration: InputDecoration(hintText: "Enter Your Country"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 128, 0, 128),
                    minimumSize: Size(240, 50),
                  ),
                  onPressed: () async {
                    await users.add(
                      {
                        'name': textname,
                        'phone': numberph,
                        'state': textstate,
                        'country': textcountry,
                      },
                    );
                    print("User Added");
                  },
                  child: Text("Send"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
