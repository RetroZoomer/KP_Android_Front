import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: Stack(
          children: [
            Column(
              children: [
                // Сила
                Container(
                  padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                  "СИЛА",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "15",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                Container(
                  padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                  "ЛОВКОСТЬ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "15",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                Container(
                  padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                  "ТЕЛОСЛОЖЕНИЕ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "15",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                          "+2",
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
                          "+2",
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
                Container(
                  padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                  "ИНТЕЛЛЕКТ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "15",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                Container(
                  padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                  "МУДРОСТЬ",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "15",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                Container(
                  padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                  "ХАРИЗМА",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                  "15",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
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
                          "+2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Рамка(страница)

          ],
        ),
      ),


    );
  }
}
