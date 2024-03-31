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
  int value = 0;

  @override
  void initState() {
    super.initState();
    text = widget.text;
    maxValue = widget.maxValue;
    picture = widget.picture;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          value++;
        });
      },
      onLongPress: () {
        setState(() {
          value--;
        });
      },
      child: Container(
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
                      "$picture"
                  )
                ),
            ),
            value>0?
            Text(
              "$value",
              style: TextStyle(
                  color: Colors.white
              ),
            )
                :
            Text(
              text,
              style: TextStyle(
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
