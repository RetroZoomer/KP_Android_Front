import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'definite_dice_roll.dart';

class DiceRolls extends StatefulWidget {
  const DiceRolls({super.key});

  @override
  State<DiceRolls> createState() => _DiceRollsState();
}

class _DiceRollsState extends State<DiceRolls> {
  late bool isDicesVisible;
  late bool isResultThrowVisible;
  late int countTypeThrow;
  late int countK4;
  late int countK6;
  late int countK8;
  late int countK10;
  late int countK12;
  late int countK20;
  late int countK100;

  late int resThrows;
  late String sumThrows;
  late String countThrows;

  void throwDices(int count, int maxValue) {
    int res = 0;
    int a = 0;
    String sumString = '';
    countTypeThrow++;
    for (int i = 0;i < count;i++) {
      a = Random().nextInt(maxValue) + 1;
      res+= a;
      if (i != count - 1) {
        sumString += "$a + ";
      }
      else {
        sumString += "$a";
      }
    }
    if (res != 0) {
      if (countTypeThrow <= 1) {
        sumThrows += "($sumString)";
        countThrows += "($countк$maxValue)";
      } else {
        sumThrows += " + ($sumString)";
        countThrows += " + ($countк$maxValue)";
      }
      resThrows += res;
    }
  }


  @override
  void initState() {
    super.initState();
    countTypeThrow = 0;
    countK4 = 0;
    countK6 = 0;
    countK8 = 0;
    countK10 = 0;
    countK12 = 0;
    countK20 = 0;
    countK100 = 0;

    resThrows = 0;
    countThrows = '';
    sumThrows = '';

    isDicesVisible = false;
    isResultThrowVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Кубы
        Positioned(
            left: 20,
            bottom: 125,
            // Нажатие, вызов меню кубов
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    isDicesVisible = !isDicesVisible;

                    countK4 = 0;
                    countK6 = 0;
                    countK8 = 0;
                    countK10 = 0;
                    countK12 = 0;
                    countK20 = 0;
                    countK100 = 0;
                  });
                },
                child:
                isDicesVisible?
                Row(
                  children: [
                    Column(
                      children: [
                        // к8
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              countK8++;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              countK8--;
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(top: 5, left: 5),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.red,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child:
                                  Image(
                                      image: AssetImage(
                                          "assets/images/dice-d8-logotic.png"
                                      )
                                  ),
                                ),
                                countK8>0?
                                Text(
                                  "$countK8",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                                    :
                                Text(
                                  "к8",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // к6
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              countK6++;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              countK6--;
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(top: 5, left: 5),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.red,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child:
                                  Image(
                                      image: AssetImage(
                                          "assets/images/dice-d6-logotic.png"
                                      )
                                  ),
                                ),
                                countK6>0?
                                Text(
                                  "$countK6",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                                    :
                                Text(
                                  "к6",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // к4
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              countK4++;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              countK4--;
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(top: 5, left: 5),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.red,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child:
                                  Image(
                                      image: AssetImage(
                                          "assets/images/dice-d4-logotic.png"
                                      )
                                  ),
                                ),
                                countK4>0?
                                Text(
                                  "$countK4",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                                    :
                                Text(
                                  "к4",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),


                        countK4.isEqual(0) && countK6.isEqual(0) && countK8.isEqual(0) && countK10.isEqual(0) && countK12.isEqual(0) && countK20.isEqual(0) && countK100.isEqual(0)?
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(top: 5, left: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.red,
                          ),
                          child: Center(
                              child: Icon(CupertinoIcons.xmark, color: Colors.white, size: 40,)
                          ),
                        )
                            :
                        //Кнопка "Бросить"
                        GestureDetector(
                          onTap: () {
                            resThrows = 0;
                            sumThrows = '';
                            countThrows = '';

                            countK4>0?throwDices(countK4, 4):'';
                            countK6>0?throwDices(countK6, 6):'';
                            countK8>0?throwDices(countK8, 8):'';
                            countK10>0?throwDices(countK10, 10):'';
                            countK12>0?throwDices(countK12, 12):'';
                            countK20>0?throwDices(countK20, 20):'';
                            countK100>0?throwDices(countK100, 100):'';

                            setState(() {
                              isDicesVisible = !isDicesVisible;
                              if (!isResultThrowVisible) {
                                isResultThrowVisible = !isResultThrowVisible;
                              }

                              countK4 = 0;
                              countK6 = 0;
                              countK8 = 0;
                              countK10 = 0;
                              countK12 = 0;
                              countK20 = 0;
                              countK100 = 0;

                              countTypeThrow = 0;

                            });
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
                                child: Text(
                                  "Бросить",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        // k100
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              countK100++;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              countK100--;
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(top: 5, left: 5),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.red,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child:
                                  Image(
                                      image: AssetImage(
                                          "assets/images/dice-d10-logotic.png"
                                      )
                                  ),
                                ),
                                countK100>0?
                                Text(
                                  "$countK100",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                                    :
                                Text(
                                  "к100",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // k20
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              countK20++;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              countK20--;
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(top: 5, left: 5),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.red,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child:
                                  Image(
                                      image: AssetImage(
                                          "assets/images/dice-d20-logotic.png"
                                      )
                                  ),
                                ),
                                countK20>0?
                                Text(
                                  "$countK20",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                                    :
                                Text(
                                  "к20",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // k12
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              countK12++;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              countK12--;
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(top: 5, left: 5),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.red,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child:
                                  Image(
                                      image: AssetImage(
                                          "assets/images/dice-d12-logotic.png"
                                      )
                                  ),
                                ),
                                countK12>0?
                                Text(
                                  "$countK12",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                                    :
                                Text(
                                  "к12",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // k10
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              countK10++;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              countK10--;
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(top: 5, left: 5),
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.red,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child:
                                  Image(
                                      image: AssetImage(
                                          "assets/images/dice-d10-logotic.png"
                                      )
                                  ),
                                ),
                                countK10>0?
                                Text(
                                  "$countK10",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                                    :
                                Text(
                                  "к10",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
                    :
                Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.red,
                  ),
                  child: Center(
                      child: Image.asset("assets/images/dice-twenty.png", width: 45,)
                  ),
                )
            )
        ),

        // История бросков
        Positioned(
          right: 0,
          bottom: 200,
          child:
          isResultThrowVisible?
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isResultThrowVisible = !isResultThrowVisible;
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey.shade200,
                      border: Border.all(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.grey,
                      )
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
              SizedBox(width: 5),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only( right: 20, bottom: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                    border: Border.all(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Colors.grey,
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Основные чилса
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "БРОСОК",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple.shade600
                          ),
                        ),
                        SizedBox(height: 2,),
                        Text("$sumThrows"),
                        Text(
                          "$countThrows",
                          style: TextStyle(
                            fontSize: 12.5,
                            color: Colors.grey.shade600,
                          ),
                        )
                      ],
                    ),
                    // Результат
                    Container(
                      padding: EdgeInsets.only( right: 8, left: 8),
                      child: Text(
                        "$resThrows",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          )
          :
          SizedBox()
        )
      ],
    );
  }
}
