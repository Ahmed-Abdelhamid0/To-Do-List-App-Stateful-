import 'package:flutter/material.dart';
import 'package:todo_app/model/task_data.dart';

class SingleTask extends StatefulWidget {
  final Task task;
  final Function update;

  SingleTask({super.key, required this.task, required this.update});

  @override
  State<SingleTask> createState() => _SingleTaskState();
}

class _SingleTaskState extends State<SingleTask> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(13),
      child: Column(
        children: [
          ListTile(
              title: Text(
                widget.task.content!,
                style: TextStyle(
                  fontSize: 17,
                  decoration: widget.task.isDone!
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              subtitle: Text(
                widget.task.taskStatus!,
              ),
              trailing: Checkbox(
                checkColor: Colors.black,
                fillColor: MaterialStatePropertyAll(
                  Colors.white,
                ),
                shape: CircleBorder(),
                value: widget.task.isDone!,
                onChanged: (val) {
                  setState(() {
                    widget.task.changeCheckBoxStatus();
                    widget.update;
                  });
                },
              ),
              ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}


