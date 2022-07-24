import 'package:flutter/material.dart';
import 'package:routine/Screens/HomePage.dart';

class NewTask extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 1, 1),
            child: Text('What is to be done',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue),),
          ),

          Row(
            children: [
              SizedBox(
                width:  MediaQuery.of(context).size.width*0.9,
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
              Icon(Icons.mic_outlined,size: 30),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('Due Date',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue),),
          ),
          Row(
            children: [
              SizedBox(
                width:  MediaQuery.of(context).size.width*0.9,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Date Not Set',
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 5),
                      ),
                    ),
                  ),
                ),
              ),
              Icon(Icons.calendar_month_outlined),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.blue),),
          ),
          Row(
            children: [
              SizedBox(
                width:  MediaQuery.of(context).size.width*0.9,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter description',
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 5),
                      ),
                    ),
                  ),
                ),
              ),
              Icon(Icons.note_add_outlined),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[50],
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
        },
        child: Icon(Icons.check_outlined,color: Colors.blue),
      ),
    );
  }
}
