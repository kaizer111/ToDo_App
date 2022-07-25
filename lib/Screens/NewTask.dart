import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routine/Controller/DatetimeController.dart';
import 'package:routine/Screens/HomePage.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final datetimeController= Provider.of<DatetimeController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
                    decoration: InputDecoration(
                      hintText: 'Enter Task Here',
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 5),
                      ),
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.mic_outlined,
                size: 35,
                color: Colors.blue,
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
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
                      hintText: '${datetimeController.selecteddate.year}-${datetimeController.selecteddate.month}-${datetimeController.selecteddate.day}',
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide: BorderSide(width: 3),
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
                      lastDate: DateTime(2100));
                  if(selectedDate==null){
                    scaffoldMessenger.showSnackBar(SnackBar(content: const Text('No date selected',style: TextStyle(
                      color: Colors.white
                    ),)
                    ,backgroundColor: Colors.red.shade300,));
                  }
                  else{
                    datetimeController.selecteddate=selectedDate;
                  }
                },
                icon: Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
         const  Padding(
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
                    decoration: InputDecoration(
                      hintText: 'Enter description',
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.note_add_outlined,
                color: Colors.blue,
                size: 35,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[50],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(Icons.check_outlined, color: Colors.blue),
      ),
    );
  }
}
