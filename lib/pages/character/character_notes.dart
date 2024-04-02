import 'package:flutter/cupertino.dart';
import 'package:kp_android/pages/character/widget/extandable_text_widget.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          child: Column(
            children: [
              ExtandableTextWidget(header: "Заметки 1", text: ""),
            ],
          ),
        )
      ],
    );
  }
}
