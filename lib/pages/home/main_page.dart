import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kp_android/data/rep/my_characters_repo.dart';

import '../../controllers/my_characters_controller.dart';
import '../../routes/route_helper.dart';
import 'main_page_body.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    Get.find<MyCharacterController>().getMyCharactersList();

    void _addCharacter() {
      var myCharacterController = Get.find<MyCharacterController>();
      myCharacterController.addNewCharacter().then((value) {
        Get.find<MyCharacterController>().getMyCharactersList();
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          // Список персонажей
          Column(
            children: [
              // Шапка
              Container(
                  child: Container(
                    margin: EdgeInsets.only(top: 45, bottom: 15),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // лого
                        Container(
                            width: 60,
                            height: 60,
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
                        Column(
                          children: [
                            Text("Мои персонажи",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24
                              ),
                            ),
                            // Text("?/30",
                            // style: TextStyle(
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 24
                            // ),)
                          ],
                        ),
                        // Профиль пользователя
                        Center(
                          child: GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteHelper.getSignIn());
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.red,
                              ),
                              child: Icon(Icons.exit_to_app, color: Colors.white, size: 45,),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ),
              // Основной контент(лист персонажей)
              Expanded(
                  child: SingleChildScrollView(
                    child: MainPageBody(),
                  )
              ),
            ],
          ),
          // Кнопка добавления персонажа
          Positioned(
            right: 20,
            bottom: 125,
            child: GestureDetector(
              onTap: () {
                _addCharacter();
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.red,
                ),
                child: Center(
                child: Icon(
                  CupertinoIcons.plus_circle_fill,
                  color: Colors.white,
                  size: 45,
                ),
              ),
                        ),
            ),
          ),
          // Кнопка к инициативе
          Positioned(
            left: 20,
            bottom: 125,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getInitiative());
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.red,
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.list_bullet,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
