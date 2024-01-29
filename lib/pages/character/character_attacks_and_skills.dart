import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttacksAndSkills extends StatefulWidget {
  const AttacksAndSkills({super.key});

  @override
  State<AttacksAndSkills> createState() => _AttacksAndSkillsState();
}

class _AttacksAndSkillsState extends State<AttacksAndSkills> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          child: Column(
            children: [
              // Подпись окна
              Container(
                child: Row(children: [
                  Text("Атаки и заклинания"),
                  Icon(Icons.arrow_drop_up)
                ]),
              ),
              // Окно
              Row(
                children: [
                  Expanded(child:
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 1.0,
                          color: Colors.grey.shade400,
                        )
                    ),
                    child: Text("Aрбалет 1к8"),
                  ))
                ],
              )

            ],
          ),
        )
      ],
    );
  }
}
