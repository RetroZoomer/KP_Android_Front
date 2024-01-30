import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kp_android/pages/character/widget/extandable_text_widget.dart';

class AdditionalAbilities extends StatefulWidget {
  const AdditionalAbilities({super.key});

  @override
  State<AdditionalAbilities> createState() => _AdditionalAbilitiesState();
}

class _AdditionalAbilitiesState extends State<AdditionalAbilities> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          child: Column(
            children: [
              ExtandableTextWidget(header: "Дополнительные способности и умения", text: "Знание языков: Общий")
            ],
          ),
        )
      ],
    );
  }
}
