//import 'dart:async';
import 'package:flutter/material.dart';

class TeaTimer extends StatefulWidget {
  @override 
  _TeaTimerState createState() => _TeaTimerState();
}



class _TeaTimerState extends State<TeaTimer>{
  
  


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child:Text("00:00")
          ),
        ElevatedButton(
          child: Text("Start"),
          onPressed: () => {print("Button has been pressed!")},
        )
      ],
    );
  }
}