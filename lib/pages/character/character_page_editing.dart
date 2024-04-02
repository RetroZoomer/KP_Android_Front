import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kp_android/pages/character/widget/character_characterisitcs.dart';
import 'package:kp_android/pages/character/widget/extandable_text_widget.dart';
import 'package:kp_android/routes/route_helper.dart';

import '../../controllers/my_characters_controller.dart';
import '../../models/user_model.dart';

class CharacterPageEditing extends StatefulWidget {
  int pageId;
  CharacterPageEditing({Key? key, required this.pageId}) : super(key: key);

  @override
  State<CharacterPageEditing> createState() => _CharacterPageEditingState();
}

class _CharacterPageEditingState extends State<CharacterPageEditing> {
  PageController pageController = PageController(viewportFraction: 0.9);

  int CalculateModifier(int value) {
    double res = (value / 2 - 5);
    return res.ceil();
  }

  int CalculateProficiency(int value) {
    int res = 0;
    if (value <= 4) {
      res = 2;
    }
    if (value >= 5 && value <= 8) {
      res = 3;
    }
    if (value >= 9 && value <= 12) {
      res = 4;
    }
    if (value >= 13 && value <= 16) {
      res = 5;
    }
    if (value >= 17) {
      res = 6;
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    var character = Get.find<MyCharacterController>().myCharacterList[widget.pageId];

    var nameController = TextEditingController();
    var raceController = TextEditingController();
    var nameClassController = TextEditingController();
    var speedController = TextEditingController();
    var levelController = TextEditingController();
    var acController = TextEditingController();
    var realHpController = TextEditingController();

    void _editCharacter(CharacterModel characterModel) {
      var myCharacterController = Get.find<MyCharacterController>();

      String name = nameController.text.trim();
      String race = raceController.text.trim();
      String nameClass = nameClassController.text.trim();
      String speed = speedController.text.trim();
      String level = levelController.text.trim();
      String ac = acController.text.trim();
      String realHp = realHpController.text.trim();

      character.name = name;
      character.race = race;
      character.nameClass = nameClass;
      character.speed = int.parse(speed);
      character.level = int.parse(level);
      character.ac = int.parse(ac);
      character.realHP = int.parse(realHp);

      myCharacterController.editCharacter(character).then((value) {
        Get.toNamed(RouteHelper.getMyCharacter(widget.pageId));
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              SizedBox(height: 40,),
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
                  "Редактирование персонажа",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                  ),

                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Имя: " + character.name.toString(),
                        style: TextStyle(fontSize: 16)
                    )
                  ]
              ),
              Container(
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Имя",

                  ),
                ),
              ),
              SizedBox(height: 20,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Расса: " + character.race.toString(),
                        style: TextStyle(fontSize: 16)
                    )
                  ]
              ),
              Container(
                child: TextField(
                  controller: raceController,
                  decoration: InputDecoration(
                    hintText: "Расса",

                  ),
                ),
              ),
              SizedBox(height: 20,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Класс: " + character.nameClass.toString(),
                        style: TextStyle(fontSize: 16)
                    )
                  ]
              ),
              Container(
                child: TextField(
                  controller: nameClassController,
                  decoration: InputDecoration(
                    hintText: "Класс",

                  ),
                ),
              ),
              SizedBox(height: 20,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Уровень: " + character.level.toString(),
                        style: TextStyle(fontSize: 16)
                    )
                  ]
              ),
              Container(
                child: TextField(
                  controller: levelController,
                  decoration: InputDecoration(
                    hintText: "Уровень",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Скорость: " + character.speed.toString(),
                        style: TextStyle(fontSize: 16)
                    )
                  ]
              ),
              Container(
                child: TextField(
                  controller: speedController,
                  decoration: InputDecoration(
                    hintText: "Скорость",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "КД(Класс Доспеха): " + character.ac.toString(),
                        style: TextStyle(fontSize: 16)
                    )
                  ]
              ),
              Container(
                child: TextField(
                  controller: acController,
                  decoration: InputDecoration(
                    hintText: "КД",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Здоровье: " + character.realHP.toString(),
                        style: TextStyle(fontSize: 16)
                    )
                  ]
              ),
              Container(
                child: TextField(
                  controller: realHpController,
                  decoration: InputDecoration(
                    hintText: "Здоровье",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(height: 20,),

              // Container(
              //   margin: EdgeInsets.only(left: 40, right: 40),
              //   child: TextField(
              //     // controller: ,
              //     decoration: InputDecoration(
              //       hintText: "Password",
              //     ),
              //   ),
              // ),
              SizedBox(height: 60,),
              GestureDetector(
                onTap: (){
                  _editCharacter(character);
                },
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Изменить",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
