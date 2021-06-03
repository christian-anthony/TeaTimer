//import 'dart:async';
import 'package:flutter/material.dart';

class TeaTimer extends StatefulWidget {
  @override 
  _TeaTimerState createState() => _TeaTimerState();
}



class _TeaTimerState extends State<TeaTimer>{
  
  Stopwatch _stopwatch = Stopwatch();

@override
void didUpdateWidget(TeaTimer oldWidget) {
  if (_stopwatch.isRunning){
    setState(() {print('butt');});
    }
  }

  void startTimer(){
    setState(() {
      _stopwatch.start();
    });
  }

  bool isRunning(){
    return _stopwatch.isRunning;
  }

@override
  void initState() {
    super.initState();
    if (_stopwatch.isRunning){
      setState(() {});
    }
  }
  

  // String toString(){
  //   return _stopwatch.elapsed.toString();
  // }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child:Text(
            _stopwatch.elapsed.toString()
            )
          ),
        FloatingActionButton(onPressed: () => startTimer())
      ],
    );
  }
}