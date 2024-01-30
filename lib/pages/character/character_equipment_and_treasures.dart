import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kp_android/pages/character/widget/extandable_text_widget.dart';

class EquipmentAndTreasures extends StatefulWidget {
  const EquipmentAndTreasures({super.key});

  @override
  State<EquipmentAndTreasures> createState() => _EquipmentAndTreasuresState();
}

class _EquipmentAndTreasuresState extends State<EquipmentAndTreasures> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(Icons.attach_money, color: Colors.yellow.shade700,),
                    Text("45")
                  ],
                ),
              ),
              ExtandableTextWidget(header: "Снаряжение", text: "Броня"),
              SizedBox(height: 15,),
              ExtandableTextWidget(header: "Сокровища", text: "Корона Вульриха 5-го"),
            ],
          ),
        )
      ],
    );
  }
}
