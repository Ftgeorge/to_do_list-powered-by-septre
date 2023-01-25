import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String NameofTask;
  final bool Completedtask;
  Function(bool?)? onChanged;

  TodoTile(
      {super.key,
      required this.Completedtask,
      required this.NameofTask,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        // ignore: sort_child_properties_last
        child: Row(
          children: [
            Checkbox(value: Completedtask, onChanged: onChanged),
            Text(
              "Make Tutorial",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Oxygen',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
