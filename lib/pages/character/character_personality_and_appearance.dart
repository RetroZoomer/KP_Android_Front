import 'package:flutter/cupertino.dart';
import 'package:kp_android/pages/character/widget/extandable_text_widget.dart';

class PersonalityAndAppearance extends StatefulWidget {
  const PersonalityAndAppearance({super.key});

  @override
  State<PersonalityAndAppearance> createState() => _PersonalityAndAppearanceState();
}

class _PersonalityAndAppearanceState extends State<PersonalityAndAppearance> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          child: Column(
            children: [
              ExtandableTextWidget(header: "Предыстория персонажа", text: ""),
              // ExtandableTextWidget(header: "Черты характера", text: ""),
              // ExtandableTextWidget(header: "Идеалы", text: ""),
              // ExtandableTextWidget(header: "Привязанности", text: ""),
              // ExtandableTextWidget(header: "Слабости", text: ""),
            ],
          ),
        )
      ],
    );
  }
}
