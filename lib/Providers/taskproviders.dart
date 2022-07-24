import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskProviders extends ChangeNotifier {

  List<TaskModel> taskList = [];

  void addtask(TaskModel taskModel) {

    taskList.add(taskModel);

  }
  void removetask(int index) {

    taskList.removeAt(index);

  }

}
