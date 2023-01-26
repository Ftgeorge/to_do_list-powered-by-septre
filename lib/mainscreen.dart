import 'package:flutter/material.dart';

import 'components/todo_tile.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List ToDoList = [
    ['Sleep Now', false],
    ["Do Exercise", false]
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: const Text(
            'TO DO',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Oxygen',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: ToDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            Completedtask: ToDoList[index][1],
            NameofTask: ToDoList[index][0],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
