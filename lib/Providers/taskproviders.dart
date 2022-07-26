import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskProviders extends ChangeNotifier {

  List<TaskModel> taskList = [];

  void addtask(TaskModel taskModel) {

    taskList.add(taskModel);
    notifyListeners();


  }
  void removetask(int index) {

    taskList.removeAt(index);
    notifyListeners();

  }

}
