import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kp_android/controllers/my_characters_controller.dart';
import 'package:kp_android/login.dart';
import 'package:kp_android/pages/character/character_page.dart';
import 'package:kp_android/pages/home/main_page.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<MyCharacterController>().getMyCharactersList();
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: MainPage(),
    );
  }
}
