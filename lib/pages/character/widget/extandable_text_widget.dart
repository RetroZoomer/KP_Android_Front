import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExtandableTextWidget extends StatefulWidget {
  final String header;
  final String text;
  const ExtandableTextWidget({super.key, required this.header, required this.text});

  @override
  State<ExtandableTextWidget> createState() => _ExtandableTextWidgetState();
}

class _ExtandableTextWidgetState extends State<ExtandableTextWidget> {
  bool isHiddenText = false;
  late String header;
  late String text;


  @override
  void initState() {
    super.initState();
    header = widget.header;
    text = widget.text;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            children: [
              // Подпись окна
              InkWell(
                onTap: () {
                  setState(() {
                    isHiddenText = !isHiddenText;
                  });
                },
                child: Row(children: [
                  Text(header),
                  Icon(isHiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up)
                ]),
              ),
              // Окно
              Row(
                children: [
                  // Текст
                  Expanded(child:
                    isHiddenText?
                    Container(
                      height: 2,
                      padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 1.0,
                            color: Colors.grey.shade400,
                          )
                      ),
                    )
                        :
                    Container(
                      padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 1.0,
                            color: Colors.grey.shade400,
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              text
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
