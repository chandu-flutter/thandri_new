import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:thandri_sannidhi/home.dart';
import 'package:thandri_sannidhi/navbar.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuBackgroundColor: Color.fromARGB(255, 30, 36, 40),
      menuScreen: NavBar(),
      mainScreen: HomeScreen(),
      angle: -10,
      duration: Duration(milliseconds: 600),
      showShadow: true,
      drawerShadowsBackgroundColor: Color.fromARGB(255, 128, 0, 28),
      slideWidth: MediaQuery.of(context).size.width * 0.85,
    );
  }
}
