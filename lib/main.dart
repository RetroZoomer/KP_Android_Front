import 'package:flutter/material.dart';
import 'package:kp_android/login.dart';
import 'package:kp_android/pages/character/character_page.dart';
import 'package:kp_android/pages/home/main_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: MainPage(),
    home: CharacterPage(),
  ));
}

