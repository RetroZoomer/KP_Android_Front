import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kp_android/pages/auth/sign_up_page.dart';
import 'package:kp_android/routes/route_helper.dart';

import '../../controllers/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = TextEditingController();
    var passwordController = TextEditingController();

    void _login() {
      var authController = Get.find<AuthController>();
      String login = loginController.text.trim();
      String password = passwordController.text.trim();

      authController.login(login, password).then((status){
        if (status.isSuccess) {
          Get.toNamed(RouteHelper.getInitial());
        }
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 150,),
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red,
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                            "assets/images/dice-twenty-faces-twenty.png"
                        )
                    )
                )
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              child: Text(
                "Вход в аккаунт",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),

              ),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                controller: loginController,
                decoration: InputDecoration(
                  hintText: "Login",
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
            ),
            SizedBox(height: 60,),
            GestureDetector(
              onTap: (){
                _login();
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Войти в аккаунт",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            RichText(
                text: TextSpan(
                    text: "Нет аккаунта?",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 18
                    ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(), transition: Transition.fade),
                      text: " Создай",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ]
                )
            )
          ],
        ),
      ),
    );
  }
}
