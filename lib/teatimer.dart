import 'dart:async';
import 'package:flutter/material.dart';

class TeaTimer extends StatefulWidget {
  @override 
  _TeaTimerState createState() => _TeaTimerState();
}

class _TeaTimerState extends State<TeaTimer>{
  
  Timer? _timer;
  Duration _currentDuration = Duration();
  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //color: Colors.red,
      child: Column(
        children: [
          timerText(context),
          ElevatedButton(
            child: Text("Start: 10 sec"),
            onPressed: () => onButtonPress(), 
          ),
        ],
      )
    );
  }

  //Creates a new periodic timer. 
  void startTimer()
  {
    //This is to check if theres a currently running timer but i dont think that could ever be when calling start.
    if (_timer != null){
      _timer?.cancel();
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) { onTick(); });
    isRunning = true;
  }

  //Stops the timer currently running
  void stopTimer()
  {
    _timer?.cancel();
    isRunning = false;
  }

  //Logic for the timer to call every tick
  void onTick()
  {
    if (_currentDuration == Duration.zero)
    {
      stopTimer();
      soundAlarm();
    }
    else
    {
      decrementSeconds();
    }
  }

  //Decrements the time display
  void decrementSeconds()
  {
    setState(() 
    {
      _currentDuration -= Duration(seconds: 1); 
    });
  }

  //Clears any currently running timers and creates new timer
  void onButtonPress()
  {
    if (isRunning){
      stopTimer();
    }
    else{
      setState(() {
        _currentDuration = Duration(seconds: 10);   //This is a temp hardcoded value for testing
        startTimer();
      });
    }
  }

  //Displays the formatted text for the timer duration
  Widget timerText(BuildContext context){
    return Text("${_currentDuration.inMinutes}".padLeft(2,"0") + ":" + "${_currentDuration.inSeconds % Duration.secondsPerMinute}".padLeft(2,"0"),
    style: TextStyle(
      fontSize: 80,
    ),);
  }

  //Called on timer completion, plays sound
  void soundAlarm(){}

} //End of TeaTimer

 