import 'package:flutter/material.dart';
import 'package:todo_app/app_folder/add_task.dart';
import 'package:todo_app/app_widgets/app_appbar.dart';
import 'package:todo_app/app_widgets/app_fab.dart';
import 'package:todo_app/app_folder/single_task.dart';
import 'package:todo_app/model/task_data.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {


  List<Task> task = [];
  void updateScreen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      floatingActionButton: fAB(onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return AddTask(addToList: (txtVal) {
              setState(() {
                task.add(Task(content: txtVal));
              });
              Navigator.of(context).pop();
            });
          },
        );
      }),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: task.length,
        itemBuilder: (context, index) {
          return SingleTask(
              task: task[index],
              update: updateScreen,
          );
        },
      ),
    );
  }
}
