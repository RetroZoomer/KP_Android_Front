import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kp_android/pages/auth/sign_in_page.dart';
import 'package:kp_android/routes/route_helper.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adventure story',

      // home: CharacterPageEditing(pageId: 0,),
      home: SignInPage(),
      initialRoute: RouteHelper.SignIn,
      getPages: RouteHelper.routes,
    );
  }
}
