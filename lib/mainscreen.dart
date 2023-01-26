import 'package:flutter/material.dart';
import 'package:to_do_list/components/alert_box.dart';

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

  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
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
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: const Icon(Icons.add_task_outlined),
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
