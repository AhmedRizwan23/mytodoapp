import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?) onChanged;
  Function()? deletetask;

  Todotile(
      {super.key,
      required this.deletetask,
      required this.onChanged,
      required this.taskcompleted,
      required this.taskname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          IconButton(onPressed: deletetask, icon: const Icon(Icons.delete))
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[400], borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Checkbox(
                  value: taskcompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  taskname,
                  style: TextStyle(
                      decoration: taskcompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
