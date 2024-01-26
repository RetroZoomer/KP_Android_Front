import 'dart:js';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kp_android/utils/dimensions.dart';

class MainPageBody extends StatefulWidget {
  const MainPageBody({super.key});

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
        ),
        ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 30,
              itemBuilder: (context, index) {
                // рамка персонажа
                return Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200,
                    border: Border.all(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.grey.shade400,
                    )
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Изображение персонажа
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                            // image: DecorationImage(
                            //     image: AssetImage(
                            //         "assets/images/person.png"
                            //     )
                            // )
                        ),
                        child: Icon(Icons.person_outline_outlined, color: Colors.white, size: 70,),
                      ),
                      // Основная информация
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 3, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Имя
                                Text(
                                  "Макота Шин",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                  ),
                                ),
                                // Специализация
                                Text(
                                  "Табакси - Плут",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                                // ХП
                                Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red.shade400,
                                    ),
                                    Text(
                                      "40/50",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.green.shade900
                                      ),
                                    ),
                                  ],
                                ),
                                // КД
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.shield_lefthalf_fill,
                                      color: Colors.grey.shade700,
                                    ),
                                    Text(
                                      "15",
                                      style: TextStyle(
                                          fontSize: 16,
                                          // color: Colors.green.shade800
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                      ),
                       Container(
                         padding: EdgeInsets.only(top: 2, right: 8),
                            child: Icon(Icons.keyboard_control_rounded, size: 35, color: Colors.grey.shade700,),
                      )
                    ],
                  ),
                );
              }),

      ],

    );
  }
}
