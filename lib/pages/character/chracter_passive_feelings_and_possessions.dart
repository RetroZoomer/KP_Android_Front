import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kp_android/pages/character/widget/extandable_text_widget.dart';

class PassiveFeelingsAndPossessions extends StatefulWidget {
  const PassiveFeelingsAndPossessions({super.key});

  @override
  State<PassiveFeelingsAndPossessions> createState() => _PassiveFeelingsAndPossessionsState();
}

class _PassiveFeelingsAndPossessionsState extends State<PassiveFeelingsAndPossessions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.grey.shade400),
                                left: BorderSide(color: Colors.grey.shade400),
                                bottom: BorderSide(color: Colors.grey.shade400)
                            ),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                        ),
                        child: Text("Мудрость (Восприятие)"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Text(
                        "+2",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.grey.shade400),
                                left: BorderSide(color: Colors.grey.shade400),
                                bottom: BorderSide(color: Colors.grey.shade400)
                            ),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                        ),
                        child: Text("Мудрость (Проницательность"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Text(
                        "+2",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.grey.shade400),
                                left: BorderSide(color: Colors.grey.shade400),
                                bottom: BorderSide(color: Colors.grey.shade400)
                            ),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                        ),
                        child: Text("Интеллект (Анализ)"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Text(
                        "+2",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ExtandableTextWidget(header: "Прочие владения и языки", text: "Эльфийский"),
            ],
          ),
        )
      ],
    );
  }
}
