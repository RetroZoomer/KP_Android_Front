import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kp_android/pages/character/widget/extandable_text_widget.dart';

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
              ExtandableTextWidget(header: "Атаки и заклинания", text: "Арбалет(легкий) 1к8+2"),
              SizedBox(height: 15,),
              ExtandableTextWidget(header: "Умения и способности", text: "Божественный канал"),
            ],
          ),
        )
      ],
    );
  }
}
