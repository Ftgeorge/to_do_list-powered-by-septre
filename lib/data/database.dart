import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List ToDoList = [];
  //reference the store
  final _myBox = Hive.box('mybox');

  //If this is the 1st time ever opening this app
  void createInitialData() {
    ToDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  //load
  void loadData() {
    ToDoList = _myBox.get("TODOLIST");
  }

  //upload
  void updateDatabase() {
    _myBox.put("TODOLIST", ToDoList);
  }
}
