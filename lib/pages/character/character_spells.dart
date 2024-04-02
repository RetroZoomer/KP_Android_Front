import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kp_android/pages/character/widget/extandable_text_widget.dart';

class Spells extends StatefulWidget {
  const Spells({super.key});

  @override
  State<Spells> createState() => _SpellsState();
}

class _SpellsState extends State<Spells> {
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
                    // Expanded(
                    //   child: Container(
                    //     padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                    //     decoration: BoxDecoration(
                    //         border: Border(
                    //             top: BorderSide(color: Colors.grey.shade400),
                    //             left: BorderSide(color: Colors.grey.shade400),
                    //             bottom: BorderSide(color: Colors.grey.shade400)
                    //         ),
                    //         borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                    //     ),
                    //     child: Text("Спасбросок"),
                    //   ),
                    // ),
                    // Container(
                    //   padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey.shade50,
                    //       border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
                    //       borderRadius: BorderRadius.all(Radius.circular(5))
                    //   ),
                    //   child: Text(
                    //     "14",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // SizedBox(height: 15,),
              // Container(
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Container(
              //           padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
              //           decoration: BoxDecoration(
              //               border: Border(
              //                   top: BorderSide(color: Colors.grey.shade400),
              //                   left: BorderSide(color: Colors.grey.shade400),
              //                   bottom: BorderSide(color: Colors.grey.shade400)
              //               ),
              //               borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
              //           ),
              //           child: Text("Атака"),
              //         ),
              //       ),
              //       Container(
              //         padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
              //         decoration: BoxDecoration(
              //             color: Colors.grey.shade50,
              //             border: Border.all(style: BorderStyle.solid, width: 1, color: Colors.grey.shade400,),
              //             borderRadius: BorderRadius.all(Radius.circular(5))
              //         ),
              //         child: Text(
              //           "+4",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 15,),
              ExtandableTextWidget(header: "Заговоры", text: ""),
              ExtandableTextWidget(header: "1-й уровень", text: ""),
              ExtandableTextWidget(header: "2-й уровень", text: ""),
              ExtandableTextWidget(header: "3-й уровень", text: ""),
              ExtandableTextWidget(header: "4-й уровень", text: ""),
              ExtandableTextWidget(header: "5-й уровень", text: ""),
              ExtandableTextWidget(header: "6-й уровень", text: ""),
              ExtandableTextWidget(header: "7-й уровень", text: ""),
              ExtandableTextWidget(header: "8-й уровень", text: ""),
              ExtandableTextWidget(header: "9-й уровень", text: ""),
            ],
          ),
        )
      ],
    );
  }
}
