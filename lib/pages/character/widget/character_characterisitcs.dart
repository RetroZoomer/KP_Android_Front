import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterCharacterisics extends StatefulWidget {
  final String characteristicName;
  final int value;
  const CharacterCharacterisics({super.key, required this.characteristicName, required this.value});

  @override
  State<CharacterCharacterisics> createState() => _CharacterCharacterisicsState();
}

class _CharacterCharacterisicsState extends State<CharacterCharacterisics> {
  late String characteristicName;
  late int value;

  @override
  void initState() {
    super.initState();
    characteristicName = widget.characteristicName;
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      characteristicName,
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
                      "$value",
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
    );
  }
}
