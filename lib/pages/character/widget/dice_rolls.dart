import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'definite_dice_roll.dart';

class DiceRolls extends StatefulWidget {
  const DiceRolls({super.key});

  @override
  State<DiceRolls> createState() => _DiceRollsState();
}

class _DiceRollsState extends State<DiceRolls> {
  late bool isDicesVisible;
  late int value;
  @override
  void initState() {
    super.initState();
    isDicesVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 20,
        bottom: 125,
        child: GestureDetector(
          onTap: () {
            setState(() {
              isDicesVisible = !isDicesVisible;
            });
          },
          child:
              isDicesVisible?
              Row(
                children: [
                  Column(
                    children: [
                      DefiniteDiceRoll(text: 'к8', maxValue: 8, picture: 'assets/images/dice-d8-logotic.png'),
                      DefiniteDiceRoll(text: 'к6', maxValue: 6, picture: 'assets/images/dice-d6-logotic.png'),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              value += value;
                            });
                          },
                          child: DefiniteDiceRoll(text: 'к4', maxValue: 4, picture: 'assets/images/dice-d4-logotic.png')
                      ),

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
                                ),
                    ],
                  ),
                  Column(
                    children: [
                      DefiniteDiceRoll(text: 'к100', maxValue: 100, picture: 'assets/images/dice-d10-logotic.png'),
                      DefiniteDiceRoll(text: 'к20', maxValue: 20, picture: 'assets/images/dice-d20-logotic.png'),
                      DefiniteDiceRoll(text: 'к12', maxValue: 12, picture: 'assets/images/dice-d12-logotic.png'),
                      DefiniteDiceRoll(text: 'к10', maxValue: 10, picture: 'assets/images/dice-d10-logotic.png'),

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
    );
  }
}
