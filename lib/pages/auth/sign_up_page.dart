import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kp_android/controllers/auth_controller.dart';
import 'package:kp_android/models/sign_up_body_model.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = TextEditingController();
    var passwordController = TextEditingController();

    void _registration() {
      var authController = Get.find<AuthController>();
      String login = loginController.text.trim();
      String password = passwordController.text.trim();

      SignUpBody signUpBody = SignUpBody(login: login, password: password);
      authController.registration(signUpBody);
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
                "Регистрация",
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
                _registration();
              },
              child: Container(
                width: 180,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Регистрация",
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
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                  text: "Уже есть аккаунт?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 18
                  )
                )
            )
          ],
        ),
      ),
    );
  }


}
