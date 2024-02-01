import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefiniteDiceRoll extends StatefulWidget {
  final String text;
  final int maxValue;
  final String picture;
  const DefiniteDiceRoll({super.key, required this.text, required this.maxValue, required this.picture});

  @override
  State<DefiniteDiceRoll> createState() => _DefiniteDiceRollState();
}

class _DefiniteDiceRollState extends State<DefiniteDiceRoll> {
  late String text;
  late int maxValue;
  late String picture;
  late int value;

  @override
  void initState() {
    super.initState();
    text = widget.text;
    maxValue = widget.maxValue;
    picture = widget.picture;
    value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: EdgeInsets.only(top: 5, left: 5),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.red,
      ),
      child: Column(
        children: [
          Expanded(
            child:
              Image(
                image: AssetImage(
                    picture as String
                )
              ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
