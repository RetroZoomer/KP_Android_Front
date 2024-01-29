import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'character_attacks_and_skills.dart';
import 'chracter_characteristics_and_skills.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  PageController pageController = PageController(viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
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
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Icon(Icons.arrow_back),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Макота Шин",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              )
                            ),
                            Text(
                                "Табакси - Плут",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                )
                            ),
                            Text(
                                "5 уровень",
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
                              "+1",
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
                              "30",
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
                              "+2",
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
                              "16",
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
                              "24",
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
              // Модули (Слайдер)
              Expanded(
                child: PageView.builder(
                    controller: pageController,
                    itemCount: 6,
                    // allowImplicitScrolling: true,
                    itemBuilder: (context, position) {
                  return _buildPageItem(position);
                }),
              ),
              // Навигация
              SizedBox(
                height: 100,
              )
            ],
          ),
          // История бросков
          Positioned(
              right: 0.1,
              bottom: 125,
              child: Container(
                  width: 250,
                  height: 250,
                  //todo Посмотреть начет кликабельности. Тк нужно убрать кликабельность списка после очистки
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        // Обертка
                        return Stack(
                          children: [
                            Opacity(
                                opacity: 0.1,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only( right: 20, bottom: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.shade200,
                                    border: Border.all(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Colors.grey.shade400,
                                    )
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Основные чилса
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("БРОСОК"),
                                            SizedBox(height: 2,),
                                            Text("Суммирование"),
                                            Text("Кол-во кубов")
                                          ],
                                        ),
                                        // Результат
                                        Container(
                                          padding: EdgeInsets.only(top: 2, right: 8),
                                          child: Text(
                                            "Результат",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      })
              ),
          ),
          // Кнопка скрытия истории
          Positioned(
            right: 260,
            bottom: 125,
            child: Opacity(
              opacity: 0.1,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey.shade200,
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.xmark,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
              ),
            ),
          ),
          // Кубы
          Positioned(
            left: 20,
            bottom: 125,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.red,
              ),
              child: Center(
                child: Image.asset("assets/images/dice-twenty.png", width: 45,)
              ),
            ),
          ),
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

  Widget _buildPageItem(int index) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            // color: Colors.red.shade500,
            border: Border.all(
              style: BorderStyle.solid,
              width: 1.0,
              color: Colors.grey.shade400,
            )
        ),
        child:
        // CharacteristicsAndSkills()
        AttacksAndSkills()
        )


    );
  }
}
