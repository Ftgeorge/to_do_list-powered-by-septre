import 'package:flutter/material.dart';
import 'package:to_do_list/components/alert_box.dart';
import 'package:to_do_list/data/database.dart';

import 'components/todo_tile.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final _mybox = Hive.openBox('myBox');
  ToDoDataBase db = ToDoDataBase();

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.ToDoList[index][1] = !db.ToDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      db.ToDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            Save: saveNewTask,
            Cancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deletetask(int index) {
    setState(() {
      db.ToDoList.removeAt(index);
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
        itemCount: db.ToDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            Completedtask: db.ToDoList[index][1],
            NameofTask: db.ToDoList[index][0],
            onChanged: (value) => checkBoxChanged(value, index),
            deletetodo: (context) => deletetask,
          );
        },
      ),
    );
  }
}
