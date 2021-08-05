import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'task_tile.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              longPressCallback: (){
                taskData.deleteTask(task);
              },
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (value) {
                taskData.updateTask(task);
                // setState(() {
                //   Provider.of<TaskData>(context).tasks[index].toggleDone();
                // });
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },

    );
  }
}
