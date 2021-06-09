//import 'dart:async';
import 'package:flutter/material.dart';

class TeaTimer extends StatefulWidget {

  final Stopwatch stopwatch = Stopwatch();

  @override 
  _TeaTimerState createState() => _TeaTimerState();
}



class _TeaTimerState extends State<TeaTimer>{
  
  
  Duration _currentCount = Duration();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: currentCount(context),
          ),
        ElevatedButton(
          child: Text("Start"),
          onPressed: () => {},
        )
      ],
    );
  }


  Widget currentCount(BuildContext context) {

    setState(() {});
    return Text(_currentCount.inDays.toString());
  }
}

 