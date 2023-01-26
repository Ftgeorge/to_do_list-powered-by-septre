import 'package:flutter/material.dart';
import 'package:to_do_list/components/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback Save;
  VoidCallback Cancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.Save,
      required this.Cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                button_btn(onPressed: Save, text: "Save"),

                const SizedBox(
                  width: 9,
                ),
                //Cancel
                button_btn(onPressed: Cancel, text: "Cancel"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
