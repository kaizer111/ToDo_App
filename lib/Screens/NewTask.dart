import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine/Controller/DatetimeController.dart';
import 'package:routine/Providers/taskproviders.dart';
import 'package:routine/Screens/HomePage.dart';
import 'package:routine/Screens/settings.dart';
import 'package:routine/models/task_model.dart';

class NewTask extends StatelessWidget {
  TextEditingController tasknamecontroller = TextEditingController();
  TextEditingController taskdesccontoller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final datetimeController = Provider.of<DatetimeController>(context);
    final dataprovider = Provider.of<TaskProviders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 1, 1),
              child: Text(
                'What is to be done',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: tasknamecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field cannot be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Task Here',
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 5, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.mic_outlined,
                  size: 35,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Due Date',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(

                      readOnly: true,
                      decoration: InputDecoration(
                        hintText:
                            '${datetimeController.selecteddate.year}-${datetimeController.selecteddate.month}-${datetimeController.selecteddate.day}',
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide(width: 3, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final scaffoldMessenger = ScaffoldMessenger.of(context);
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate == null) {
                      scaffoldMessenger.showSnackBar(SnackBar(
                        content: const Text(
                          'No date selected',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red.shade300,
                      ));
                    } else {
                      datetimeController.selecteddate = selectedDate;
                    }
                  },
                  icon: const Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Description',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.blue),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: taskdesccontoller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'field cannot be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter description',
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.note_add_outlined,
                  color: Colors.blue,
                  size: 35,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[50],
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            dataprovider.addtask(TaskModel(
                taskid: DateTime.now().toIso8601String(),
                taskname: tasknamecontroller.text,
                taskdesc: taskdesccontoller.text,
                duedate: datetimeController.selecteddate));
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        child: const Icon(Icons.check_outlined, color: Colors.blue),
      ),
    );
  }
}
