import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String NameofTask;
  final bool Completedtask;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletetodo;

  TodoTile(
      {super.key,
      required this.Completedtask,
      required this.NameofTask,
      required this.onChanged,
      required this.deletetodo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletetodo,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(15),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              Checkbox(value: Completedtask, onChanged: onChanged),
              Text(
                NameofTask,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Oxygen',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: Completedtask
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
