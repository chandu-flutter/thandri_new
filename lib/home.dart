import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:thandri_sannidhi/downloaad.dart';
import 'package:thandri_sannidhi/navbar.dart';
import 'package:thandri_sannidhi/new.dart';
import 'package:thandri_sannidhi/notification_page.dart';
import 'package:thandri_sannidhi/songbook.dart';
import 'package:lottie/lottie.dart';
import 'package:thandri_sannidhi/updates.dart';
import 'package:thandri_sannidhi/website.dart';

import 'prayer_victories.dart';
import 'short_sermons.dart';
import 'youtube_live.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String imageUrl;
  final storage = FirebaseStorage.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageUrl = '';
    getImageUrl();
  }

  Future<void> getImageUrl() async {
    final ref = storage.ref().child('promise.jpg');
    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: Icon(Icons.menu),
        ),
        backgroundColor: const Color.fromARGB(255, 128, 0, 128),
        title: const Text('Thandri Sannidhi'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const NotificationPage();
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.notifications_active),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Card(
                    elevation: 14,
                    child: Image(
                      image: NetworkImage(imageUrl, scale: 1.0),
                      height: 200,
                      width: 340,
                    ),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const DownloadScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.description,
                    label1: "Satya",
                    label2: "Darsanam",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NewScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.person,
                    label1: "New",
                    label2: "Here",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PrayerVictories();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.task_alt,
                    label1: "Prayer",
                    label2: "Victories",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Updates();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.notifications_active,
                    label1: "",
                    label2: "Notifications",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return YoutubeLive();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.live_tv,
                    label1: "",
                    label2: "Live",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ShortSermons();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.campaign,
                    label1: "Short",
                    label2: "Sermons",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Website();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.public,
                    label1: "",
                    label2: "Website",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SongBookScreen();
                        },
                      ),
                    );
                  },
                  child: Linked(
                    icon: Icons.auto_stories,
                    label1: "Song",
                    label2: "Book",
                  ),
                ),
                Linked(
                  icon: Icons.monetization_on,
                  label1: "",
                  label2: "Tithe",
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class Linked extends StatelessWidget {
  IconData icon;
  String label1;
  String label2;
  Linked({
    super.key,
    required this.icon,
    required this.label1,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(4, 4),
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          Icon(
            icon,
            size: 40,
            color: const Color.fromARGB(255, 128, 0, 128),
          ),
          Text(
            label2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
