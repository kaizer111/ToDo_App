import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue[900],
        title: Text('Setting',style: TextStyle(fontSize: 25),),
      ),
      body: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.blue[200],
                ),
            height: 60,
            width: 50,
            margin: EdgeInsets.all(1.5),

              )),
    );
  }
}
