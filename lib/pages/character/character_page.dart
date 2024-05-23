import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kp_android/pages/character/widget/character_characterisitcs.dart';
import 'package:kp_android/pages/character/widget/dice_rolls.dart';
import 'package:kp_android/pages/character/widget/extandable_text_widget.dart';
import 'package:kp_android/routes/route_helper.dart';

import '../../controllers/my_characters_controller.dart';

class CharacterPage extends StatefulWidget {
  int pageId;
  CharacterPage({Key? key, required this.pageId}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
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
    return Scaffold(
      body: Stack(
        children: [
          // Основная инфа
          Column(
            children: [
              //Инфа о перс.
              Container(
                margin: EdgeInsets.only(top: 45, bottom: 10),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Стрелка назад
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.initial);
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Icon(Icons.arrow_back, size: 35),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              character.name.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              )
                            ),
                            Text(
                                character.race.toString() + " - " + character.nameClass.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                )
                            ),
                            Text(
                                 character.level.toString() + " уровень",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                )
                            ),
                          ],
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                            // image: DecorationImage(
                            //     image: AssetImage(
                            //         "assets/images/person.png"
                            //     )
                            // )
                          ),
                          child: Icon(Icons.person_outline_outlined, color: Colors.white, size: 50,),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // Бонус мастерства, Скорость, Инициатива, КД, ХП
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // БМ
                    Column(
                      children: [
                        Text(
                          "БМ",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            // Icon(Icons.import_contacts_sharp),
                            Text(
                              "+" + CalculateProficiency(character.level!).toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    // Скорость
                    Column(
                      children: [
                        Text(
                          "Скорость",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              character.speed!.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    // Инициатива
                    Column(
                      children: [
                        Text(
                          "Инициатива",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              CalculateModifier(character.dexterity!).toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    // КД
                    Column(
                      children: [
                        Text(
                          "КД",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.shield_lefthalf_fill,
                              color: Colors.grey,
                            ),
                            Text(
                              character.ac!.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    // ХП
                    Column(
                      children: [
                        Text(
                          "ХП",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                                Icons.favorite,
                                color: Colors.red
                            ),
                            Text(
                              character.realHP!.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // Модули
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              // color: Colors.red.shade500,
                              border: Border.all(
                                style: BorderStyle.solid,
                                width: 1.0,
                                color: Colors.grey.shade400,
                              )
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  // Сила
                                  CharacterCharacterisics(characteristicName: "СИЛА", value: character.strength.toString()),
                                  // Броски и спасброскик
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Text("Проверка"),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            CalculateModifier(character.strength!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: 15,),

                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                    value: character.strengthSav,
                                                    activeColor: Colors.red,
                                                    shape: CircleBorder(),
                                                    onChanged: (newBool) {
                                                      setState(() {
                                                        character.strengthSav = newBool;
                                                      });
                                                    },
                                                ),
                                                Expanded(
                                                  child: Text("Спасбросок", overflow: TextOverflow.ellipsis,),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.strengthSav!)?((CalculateModifier(character.strength!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.strength!).toString()
                                            ,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Навыки
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                  value: character.athletics,
                                                  activeColor: Colors.red,
                                                  shape: CircleBorder(),
                                                  onChanged: (newBool) {
                                                    setState(() {
                                                      character.athletics = newBool;
                                                    });
                                                  },
                                                ),
                                                Text("Атлетика")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.athletics!)?((CalculateModifier(character.strength!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.strength!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15,),

                                  // Ловкость
                                  CharacterCharacterisics(characteristicName: "ЛОВКОСТЬ", value: character.dexterity.toString()),
                                  // Броски и спасброскик
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Text("Проверка"),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                          CalculateModifier(character.dexterity!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 2),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text("Спасбросок", overflow: TextOverflow.ellipsis,),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.dexteritySav!)?((CalculateModifier(character.dexterity!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.dexterity!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Навыки
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Акробатика")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.acrobatics!)?((CalculateModifier(character.dexterity!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.dexterity!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Ловкость рук")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.sleightOfHand!)?((CalculateModifier(character.dexterity!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.dexterity!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Скрытность")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.stealth!)?((CalculateModifier(character.dexterity!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.dexterity!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15,),

                                  // ТЕЛОСЛОЖЕНИЕ
                                  CharacterCharacterisics(characteristicName: "ТЕЛОСЛОЖЕНИЕ", value: character.constitution.toString()),
                                  // Броски и спасброскик
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Text("Проверка"),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            CalculateModifier(character.constitution!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 2),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text("Спасбросок", overflow: TextOverflow.ellipsis,),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.constitutionSav!)?((CalculateModifier(character.constitution!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.constitution!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15,),

                                  // ИНТЕЛЛЕКТ
                                  CharacterCharacterisics(characteristicName: "ИНТЕЛЛЕКТ", value: character.intelligence.toString()),
                                  // Броски и спасброскик
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Text("Проверка"),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            CalculateModifier(character.intelligence!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 2),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text("Спасбросок", overflow: TextOverflow.ellipsis,),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.intelligenceSav!)?((CalculateModifier(character.intelligence!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.intelligence!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Навыки
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Анализ")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.investigation!)?((CalculateModifier(character.intelligence!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.intelligence!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("История")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.history!)?((CalculateModifier(character.intelligence!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.intelligence!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Магия")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.arcana!)?((CalculateModifier(character.intelligence!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.intelligence!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Природа")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.nature!)?((CalculateModifier(character.intelligence!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.intelligence!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Религия")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.religion!)?((CalculateModifier(character.intelligence!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.intelligence!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15,),

                                  // МУДРОСТЬ
                                  CharacterCharacterisics(characteristicName: "МУДРОСТЬ", value: character.wisdom.toString()),
                                  // Броски и спасброскик
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Text("Проверка"),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            CalculateModifier(character.wisdom!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 2),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text("Спасбросок", overflow: TextOverflow.ellipsis,),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.wisdomSav!)?((CalculateModifier(character.wisdom!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.wisdom!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Навыки
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Восприятие")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.perception!)?((CalculateModifier(character.wisdom!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.wisdom!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Выживание")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.survival!)?((CalculateModifier(character.wisdom!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.wisdom!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Медицина")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.medicine!)?((CalculateModifier(character.wisdom!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.wisdom!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Проницательность")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.insight!)?((CalculateModifier(character.wisdom!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.wisdom!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Уход за животными")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.animalHandling!)?((CalculateModifier(character.wisdom!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.wisdom!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15,),

                                  // ХАРИЗМА
                                  CharacterCharacterisics(characteristicName: "ХАРИЗМА", value: character.charisma.toString()),
                                  // Броски и спасброскик
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Text("Проверка"),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            CalculateModifier(character.charisma!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 2),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text("Спасбросок", overflow: TextOverflow.ellipsis,),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.charismaSav!)?((CalculateModifier(character.charisma!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.charisma!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Навыки
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Выступление")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.performance!)?((CalculateModifier(character.charisma!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.charisma!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Запугивание")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.intimidation!)?((CalculateModifier(character.charisma!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.charisma!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Обман")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.deception!)?((CalculateModifier(character.charisma!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.charisma!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(color: Colors.grey.shade400),
                                                    left: BorderSide(color: Colors.grey.shade400),
                                                    bottom: BorderSide(color: Colors.grey.shade400)
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey.shade50,
                                                      border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                                      borderRadius: BorderRadius.all(Radius.circular(45))
                                                  ),
                                                ),
                                                Text("Убеждение")
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Text(
                                            (character.persuasion!)?((CalculateModifier(character.charisma!) + CalculateProficiency(character.level!)).toString()):CalculateModifier(character.charisma!).toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                // color: Colors.red.shade500,
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                  color: Colors.grey.shade400,
                                )
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                                  child: Column(
                                    children: [
                                      ExtandableTextWidget(header: "Атаки и заклинания", text: character.attacksAndSpells!),
                                      SizedBox(height: 15,),
                                      ExtandableTextWidget(header: "Умения и способности", text: character.skillsAndAbilities!),
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                        // Container(
                        //     margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.all(Radius.circular(15)),
                        //         // color: Colors.red.shade500,
                        //         border: Border.all(
                        //           style: BorderStyle.solid,
                        //           width: 1.0,
                        //           color: Colors.grey.shade400,
                        //         )
                        //     ),
                        //     child: AdditionalAbilities()
                        //   //EquipmentAndTreasures()
                        //   //PassiveFeelingsAndPossessions()
                        //   //PersonalityAndAppearance()
                        //   //GoalsAndObjectives()
                        //   //Notes()
                        //   //Spells()
                        // ),
                        // Container(
                        //     margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.all(Radius.circular(15)),
                        //         // color: Colors.red.shade500,
                        //         border: Border.all(
                        //           style: BorderStyle.solid,
                        //           width: 1.0,
                        //           color: Colors.grey.shade400,
                        //         )
                        //     ),
                        //     child: EquipmentAndTreasures()
                        // ),
                        // Container(
                        //     margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.all(Radius.circular(15)),
                        //         // color: Colors.red.shade500,
                        //         border: Border.all(
                        //           style: BorderStyle.solid,
                        //           width: 1.0,
                        //           color: Colors.grey.shade400,
                        //         )
                        //     ),
                        //     child: PassiveFeelingsAndPossessions()
                        //   //PersonalityAndAppearance()
                        //   //GoalsAndObjectives()
                        //   //Notes()
                        //   //Spells()
                        // ),
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                // color: Colors.red.shade500,
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                  color: Colors.grey.shade400,
                                )
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                                  child: Column(
                                    children: [
                                      ExtandableTextWidget(header: "Предыстория персонажа", text: character.background!),
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                        // Container(
                        //     margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.all(Radius.circular(15)),
                        //         // color: Colors.red.shade500,
                        //         border: Border.all(
                        //           style: BorderStyle.solid,
                        //           width: 1.0,
                        //           color: Colors.grey.shade400,
                        //         )
                        //     ),
                        //     child: GoalsAndObjectives()
                        //   //Notes()
                        //   //Spells()
                        // ),
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                // color: Colors.red.shade500,
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                  color: Colors.grey.shade400,
                                )
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                                  child: Column(
                                    children: [
                                      ExtandableTextWidget(header: "Заметки", text: character.notes1!),
                                    ],
                                  ),
                                )
                              ],
                            )
                          //Spells()
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                // color: Colors.red.shade500,
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                  color: Colors.grey.shade400,
                                )
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            // Expanded(
                                            //   child: Container(
                                            //     padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                            //     decoration: BoxDecoration(
                                            //         border: Border(
                                            //             top: BorderSide(color: Colors.grey.shade400),
                                            //             left: BorderSide(color: Colors.grey.shade400),
                                            //             bottom: BorderSide(color: Colors.grey.shade400)
                                            //         ),
                                            //         borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                            //     ),
                                            //     child: Text("Спасбросок"),
                                            //   ),
                                            // ),
                                            // Container(
                                            //   padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                            //   decoration: BoxDecoration(
                                            //       color: Colors.grey.shade50,
                                            //       border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                            //       borderRadius: BorderRadius.all(Radius.circular(5))
                                            //   ),
                                            //   child: Text(
                                            //     "14",
                                            //     style: TextStyle(
                                            //         fontWeight: FontWeight.bold
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      // SizedBox(height: 15,),
                                      // Container(
                                      //   child: Row(
                                      //     children: [
                                      //       Expanded(
                                      //         child: Container(
                                      //           padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                                      //           decoration: BoxDecoration(
                                      //               border: Border(
                                      //                   top: BorderSide(color: Colors.grey.shade400),
                                      //                   left: BorderSide(color: Colors.grey.shade400),
                                      //                   bottom: BorderSide(color: Colors.grey.shade400)
                                      //               ),
                                      //               borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                                      //           ),
                                      //           child: Text("Атака"),
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                      //         decoration: BoxDecoration(
                                      //             color: Colors.grey.shade50,
                                      //             border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                      //             borderRadius: BorderRadius.all(Radius.circular(5))
                                      //         ),
                                      //         child: Text(
                                      //           "+4",
                                      //           style: TextStyle(
                                      //               fontWeight: FontWeight.bold
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // SizedBox(height: 15,),
                                      ExtandableTextWidget(header: "Заговоры", text: character.notes2!),
                                      ExtandableTextWidget(header: "1-й уровень", text: character.spell1L!),
                                      ExtandableTextWidget(header: "2-й уровень", text: character.spell2L!),
                                      ExtandableTextWidget(header: "3-й уровень", text: character.spell3L!),
                                      ExtandableTextWidget(header: "4-й уровень", text: character.spell4L!),
                                      ExtandableTextWidget(header: "5-й уровень", text: character.spell5L!),
                                      ExtandableTextWidget(header: "6-й уровень", text: character.spell6L!),
                                      ExtandableTextWidget(header: "7-й уровень", text: character.spell7L!),
                                      ExtandableTextWidget(header: "8-й уровень", text: character.spell8L!),
                                      ExtandableTextWidget(header: "9-й уровень", text: character.spell9L!),
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                      ],
                    )


                ),
              ),
              // Навигация (Которой нет)
              SizedBox(
                height: 10,
              )
            ],
          ),
          // Кубы
          DiceRolls(),
          Positioned (
            right: 20,
            bottom: 125,
            child: GestureDetector(
                onTap: (){
                Get.toNamed(RouteHelper.getEditMyCharacter(widget.pageId));
              },
              child: Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.only(top: 5, left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.red,
                ),
                child: Center(
                    child: Icon(CupertinoIcons.pen, color: Colors.white, size: 40,)
                ),
              ),
            ),
          )

          // Выбор модуля
          // Positioned(
          //   right: 20,
          //   bottom: 125,
          //   child: Container(
          //     width: 60,
          //     height: 60,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(40),
          //       color: Colors.red,
          //     ),
          //     child: Center(
          //       child: Icon(
          //         CupertinoIcons.circle_grid_3x3_fill,
          //         color: Colors.white,
          //         size: 35,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
