import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/constants/colors.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isDone;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.isDone,
    required this.onChanged,
    this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                offset: Offset(3, 3),
                blurRadius: 15,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-3, -3),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.grey[800],
                shape: CircleBorder(
                  eccentricity: 0.5,
                ),
                value: isDone,
                onChanged: onChanged,
              ),
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 16,
                  decoration:
                      isDone ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
