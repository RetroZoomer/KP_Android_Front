import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryOfThrows extends StatefulWidget {
  const HistoryOfThrows({super.key});

  @override
  State<HistoryOfThrows> createState() => _HistoryOfThrowsState();
}

class _HistoryOfThrowsState extends State<HistoryOfThrows> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // История бросков
        Positioned(
          right: 0,
          bottom: 125,
          child: Container(
              width: 250,
              height: 250,
              //todo Неправильно разделил на виджеты. Нужно возвражение builder'a возвращать виджет history_of_throws
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    // Обертка
                    return Stack(
                      children: [
                        Opacity(
                          opacity: 1,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only( right: 20, bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.shade200,
                                border: Border.all(
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  color: Colors.grey.shade400,
                                )
                            ),
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Основные чилса
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("БРОСОК"),
                                        SizedBox(height: 2,),
                                        Text("Суммирование"),
                                        Text("Кол-во кубов")
                                      ],
                                    ),
                                    // Результат
                                    Container(
                                      padding: EdgeInsets.only(top: 2, right: 8),
                                      child: Text(
                                        "Результат",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  })
          ),
        ),
        // Кнопка скрытия истории
        Positioned(
          right: 260,
          bottom: 125,
          child: GestureDetector(
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey.shade200,
                  border: Border.all(
                    width: 1.0,
                    style: BorderStyle.solid,
                    color: Colors.grey.shade400,
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
        ),
      ],
    );
  }
}
