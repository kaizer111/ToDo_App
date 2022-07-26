import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine/Controller/DatetimeController.dart';
import 'package:routine/Providers/taskproviders.dart';
import 'package:routine/Screens/NewTask.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final dataController=Provider.of<TaskProviders>(context);
    final datetimecontroller=Provider.of<DatetimeController>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.check_circle_rounded,size: 40),
        title: Text('All Lists'),
        actions: [
          Icon(Icons.search_outlined),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(Icons.more_vert_rounded),
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
              padding:  EdgeInsets.all(15.0),
              child: Icon(Icons.mic_outlined,color: Colors.white,),
            ),
            SizedBox(
              width:  MediaQuery.of(context).size.width*0.8,
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Enter Quick Task Heres',
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
          itemBuilder: (context,index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red.shade100,

          ),
            height: 70,
            width: 100,
            margin: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.check_box_outlined,size: 40,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dataController.taskList[index].taskname),
                    Text(dataController.taskList[index].taskdesc),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Text(datetimecontroller.selecteddate.toString()),
              ],
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[50],
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewTask(),));
        },
         child: Icon(Icons.add,color: Colors.blue,size: 35,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}
