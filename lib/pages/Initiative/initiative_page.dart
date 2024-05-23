import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/route_helper.dart';

class InitiativePage extends StatefulWidget {
  const InitiativePage({super.key});

  @override
  State<InitiativePage> createState() => _InitiativePageState();
}

class _InitiativePageState extends State<InitiativePage> {
  late int characterListSize;


  @override
  void initState() {
    super.initState();
    characterListSize = 0;

  }

  @override
  Widget build(BuildContext context) {


    void _addCharacter() {
        characterListSize++;
        print(characterListSize);
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                // Шапка
                Container(
                    child: Container(
                      margin: EdgeInsets.only(top: 45, bottom: 20),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // стрелка назад
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteHelper.initial);
                            },
                            child: Container(
                              child: Icon(Icons.arrow_back, size: 35),
                            ),
                          ),
                          Column(
                            children: [
                              Text("Трекер инициативы",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Раунд: " + "1", // todo Как то инкриментируется
                        style: TextStyle(
                          fontSize: 20
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(child: SingleChildScrollView(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: characterListSize,
                      itemBuilder: (context, position) {
                        // рамка персонажа
                        return GestureDetector(
                          onTap: (){
                            // Get.toNamed(RouteHelper.getMyCharacter(position));
                          },
                          child: Container(
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

                                // Блок с изображением персонажа и инициативой
                                Stack(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      margin: EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: Icon(Icons.person_outline_outlined, color: Colors.white, size: 70,),
                                    ),
                                    // Инициатива
                                    Container(
                                      margin: EdgeInsets.only(top: 75, left: 5),
                                      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade800,
                                        borderRadius: BorderRadius.circular(360),
                                      ),
                                      child: Text(
                                        "15",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ],
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
                                            "Раймонд",
                                            // characters.myCharacterList[position].name!,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
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
                                                "16",
                                                // (characters.myCharacterList[position].realHP!).toString(),
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
                                                "11",
                                                // (characters.myCharacterList[position].ac!).toString(),
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
                                // Удалить персонажа из списка
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        //_deleteCharacter(characters.myCharacterList[position].id!);
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                                          color: Colors.red.shade400,
                                        ),
                                        // padding: EdgeInsets.only(top: 1, bottom: 1, left: 10, right: 10),
                                        // margin: EdgeInsets.only(right: 10, top: 10),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(CupertinoIcons.minus, color: Colors.white, size: 25,)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )),
                // рамка персонажа
                // GestureDetector(
                //   onTap: (){
                //     // Get.toNamed(RouteHelper.getMyCharacter(position));
                //   },
                //   child: Container(
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(20),
                //         color: Colors.grey.shade200,
                //         border: Border.all(
                //           width: 1.0,
                //           style: BorderStyle.solid,
                //           color: Colors.grey.shade400,
                //         )
                //     ),
                //     margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //
                //         // Блок с изображением персонажа и инициативой
                //         Stack(
                //           children: [
                //             Container(
                //               width: 100,
                //               height: 100,
                //               margin: EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(20),
                //                 color: Colors.red,
                //               ),
                //               child: Icon(Icons.person_outline_outlined, color: Colors.white, size: 70,),
                //             ),
                //             // Инициатива
                //             Container(
                //               margin: EdgeInsets.only(top: 75, left: 5),
                //               padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                //               decoration: BoxDecoration(
                //                 color: Colors.grey.shade800,
                //                 borderRadius: BorderRadius.circular(360),
                //               ),
                //               child: Text(
                //                 "15",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                     fontSize: 20,
                //                     fontWeight: FontWeight.bold,
                //                     color: Colors.white
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //         // Основная информация
                //         Expanded(
                //             child: Container(
                //               padding: EdgeInsets.only(left: 3, top: 10),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   // Имя
                //                   Text(
                //                     "Раймонд",
                //                     // characters.myCharacterList[position].name!,
                //                     overflow: TextOverflow.ellipsis,
                //                     style: TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 18,
                //                     ),
                //                   ),
                //                   // ХП
                //                   Row(
                //                     children: [
                //                       Icon(
                //                         Icons.favorite,
                //                         color: Colors.red.shade400,
                //                       ),
                //                       Text(
                //                         "16",
                //                         // (characters.myCharacterList[position].realHP!).toString(),
                //                         style: TextStyle(
                //                             fontSize: 16,
                //                             color: Colors.green.shade900
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   // КД
                //                   Row(
                //                     children: [
                //                       Icon(
                //                         CupertinoIcons.shield_lefthalf_fill,
                //                         color: Colors.grey.shade700,
                //                       ),
                //                       Text(
                //                         "11",
                //                         // (characters.myCharacterList[position].ac!).toString(),
                //                         style: TextStyle(
                //                           fontSize: 16,
                //                           // color: Colors.green.shade800
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ],
                //               ),
                //             )
                //         ),
                //         Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             GestureDetector(
                //               onTap: (){
                //                 // _deleteCharacter(characters.myCharacterList[position].id!);
                //               },
                //               child: Container(
                //                 width: 50,
                //                 height: 40,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                //                   color: Colors.red.shade400,
                //                 ),
                //                 // padding: EdgeInsets.only(top: 1, bottom: 1, left: 10, right: 10),
                //                 // margin: EdgeInsets.only(right: 10, top: 10),
                //                 child: Row(
                //                   crossAxisAlignment: CrossAxisAlignment.center,
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     Icon(CupertinoIcons.minus, color: Colors.white, size: 25,)
                //                   ],
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
            // Добавление персонажа в список инициативы
            Positioned(
              right: 20,
              bottom: 125,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _addCharacter();
                  });
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
                      CupertinoIcons.plus,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
