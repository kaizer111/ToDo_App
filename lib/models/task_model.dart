class TaskModel {
  String taskid;
  String taskname;
  final  taskdesc;
  final duedate;

  TaskModel({required this.taskid, required this.taskname, this.taskdesc, this.duedate});
}