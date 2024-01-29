import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacteristicsAndSkills extends StatefulWidget {
  const CharacteristicsAndSkills({super.key});

  @override
  State<CharacteristicsAndSkills> createState() => _CharacteristicsAndSkillsState();
}

class _CharacteristicsAndSkillsState extends State<CharacteristicsAndSkills> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            // Сила
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                              "СИЛА",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              "15",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Броски и спасброскик
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
                      child: Text("Проверка"),
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
                  SizedBox(width: 15,),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 2),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Expanded(
                            child: Text("Спасбросок", overflow: TextOverflow.ellipsis,),
                          )
                        ],
                      ),
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
            // Навыки
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Атлетика")
                        ],
                      ),
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
            SizedBox(height: 15,),

            // Ловкость
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                              "ЛОВКОСТЬ",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              "15",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Броски и спасброскик
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
                      child: Text("Проверка"),
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
                  SizedBox(width: 15,),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 2),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Expanded(
                            child: Text("Спасбросок", overflow: TextOverflow.ellipsis,),
                          )
                        ],
                      ),
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
            // Навыки
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Акробатика")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Ловкость рук")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Скрытность")
                        ],
                      ),
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
            SizedBox(height: 15,),

            // ТЕЛОСЛОЖЕНИЕ
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                              "ТЕЛОСЛОЖЕНИЕ",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              "15",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Броски и спасброскик
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
                      child: Text("Проверка"),
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
                  SizedBox(width: 15,),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 2),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Expanded(
                            child: Text("Спасбросок", overflow: TextOverflow.ellipsis,),
                          )
                        ],
                      ),
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
            SizedBox(height: 15,),

            // ИНТЕЛЛЕКТ
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                              "ИНТЕЛЛЕКТ",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              "15",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Броски и спасброскик
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
                      child: Text("Проверка"),
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
                  SizedBox(width: 15,),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 2),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Expanded(
                            child: Text("Спасбросок", overflow: TextOverflow.ellipsis,),
                          )
                        ],
                      ),
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
            // Навыки
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Анализ")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("История")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Магия")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Природа")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Религия")
                        ],
                      ),
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
            SizedBox(height: 15,),

            // МУДРОСТЬ
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                              "МУДРОСТЬ",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              "15",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Броски и спасброскик
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
                      child: Text("Проверка"),
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
                  SizedBox(width: 15,),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 2),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Expanded(
                            child: Text("Спасбросок", overflow: TextOverflow.ellipsis,),
                          )
                        ],
                      ),
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
            // Навыки
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Восприятие")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Выживание")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Медицина")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Проницательность")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Уход за животными")
                        ],
                      ),
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
            SizedBox(height: 15,),

            // ХАРИЗМА
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 5),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                              "ХАРИЗМА",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              "15",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Броски и спасброскик
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
                      child: Text("Проверка"),
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
                  SizedBox(width: 15,),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 2),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Expanded(
                            child: Text("Спасбросок", overflow: TextOverflow.ellipsis,),
                          )
                        ],
                      ),
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
            // Навыки
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Выступление")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Запугивание")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Обман")
                        ],
                      ),
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
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                                borderRadius: BorderRadius.all(Radius.circular(45))
                            ),
                          ),
                          Text("Убеждение")
                        ],
                      ),
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
          ],
        )
      ],
    );
  }
}
