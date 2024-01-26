import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_page_body.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.red,
                            ),
                            child: Icon(Icons.person, color: Colors.white, size: 45,),
                          ),
                        )
                      ],
                    ),
                  )
              ),
              // Основной контент
              MainPageBody(),
            ],
          ),
          // Кнопка добавления персонажа
          Positioned(
            top: 0,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
          )
        ],
      ),
    );
  }
}
