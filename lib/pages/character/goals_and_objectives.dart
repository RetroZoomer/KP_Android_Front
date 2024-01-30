import 'package:flutter/cupertino.dart';
import 'package:kp_android/pages/character/widget/extandable_text_widget.dart';

class GoalsAndObjectives extends StatefulWidget {
  const GoalsAndObjectives({super.key});

  @override
  State<GoalsAndObjectives> createState() => _GoalsAndObjectivesState();
}

class _GoalsAndObjectivesState extends State<GoalsAndObjectives> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          child: Column(
            children: [
              ExtandableTextWidget(header: "Цели и задачи", text: "")
            ],
          ),
        )
      ],
    );
  }
}
