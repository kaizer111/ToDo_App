import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine/Controller/DatetimeController.dart';
import 'package:routine/Providers/taskproviders.dart';
import 'package:routine/Screens/NewTask.dart';
import 'package:routine/Screens/settings.dart';

class HomePage extends StatelessWidget {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<TaskProviders>(context);
    final datetimecontroller = Provider.of<DatetimeController>(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.check_circle_rounded, size: 40),
        title: Text('All Lists'),
        actions: [
          Icon(Icons.search_outlined),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  child: Text('Settings'),
                  onTap: () {
                    print("tap");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },
                ),
                PopupMenuItem(child: Text('pata nahi'),
                ),
                PopupMenuItem(child: Text('firse nahi pata')),
                PopupMenuItem(child: Text('kuch nhi')),
                PopupMenuItem(child: Text('daal rahe hai')),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue[600],
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(
                Icons.mic_outlined,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Enter Quick Task Here',
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(width: 5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: dataController.taskList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red.shade100,
          ),
          height: 85,
          width: 100,
          margin: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Checkbox(
                    shape: CircleBorder(
                      side: BorderSide(width: 35, color: Colors.white),
                    ),
                    value: dataController.taskList[index].iscompleted,
                    hoverColor: Colors.blue,
                    onChanged: (bool? value) {
                      dataController.removetask(index);
                    },
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        dataController.taskList[index].taskname,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 65,
                      ),
                      Text(
                        datetimecontroller.selecteddate
                            .toString()
                            .substring(0, 11),
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(dataController.taskList[index].taskdesc),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[50],
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewTask(),
              ));
        },
        child: Icon(
          Icons.add,
          color: Colors.blue,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
