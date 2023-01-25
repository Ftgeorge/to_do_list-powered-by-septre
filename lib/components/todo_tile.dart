import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          "Make Tutorial",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Oxygen',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
