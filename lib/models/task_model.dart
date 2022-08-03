class TaskModel {
  bool iscompleted=false;
  String taskid;
  String taskname;
  final  taskdesc;
  final duedate;

  TaskModel({ required this.taskid,  required this.taskname, required this.taskdesc, required this.duedate});
}