import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kp_android/controllers/my_characters_controller.dart';
import 'package:kp_android/pages/character/character_page.dart';
import 'package:kp_android/routes/route_helper.dart';
import 'package:kp_android/utils/dimensions.dart';

class MainPageBody extends StatefulWidget {
  const MainPageBody({super.key});

  @override
  State<MainPageBody> createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    void _deleteCharacter(int characterId) {
      var myCharacterController = Get.find<MyCharacterController>();
      myCharacterController.deleteCharacter(characterId).then((value) {
        Get.find<MyCharacterController>().getMyCharactersList();
      });
    }

    return Column(
      children: [
        GetBuilder<MyCharacterController>(builder:(characters){
          return characters.isLoad == true? Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 25),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: characters.myCharacterList.length,
                itemBuilder: (context, position) {
                  // рамка персонажа
                  return GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getMyCharacter(position));
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
                          // Изображение персонажа
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
                          // Основная информация
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 3, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Имя
                                    Text(
                                      characters.myCharacterList[position].name!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // Специализация
                                    Text(
                                      characters.myCharacterList[position].race! + " - " + characters.myCharacterList[position].nameClass!,
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
                                          (characters.myCharacterList[position].realHP!).toString(),
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
                                          (characters.myCharacterList[position].ac!).toString(),
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  _deleteCharacter(characters.myCharacterList[position].id!);
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
          ) : CircularProgressIndicator();
        }),
      ],

    );
  }
}
