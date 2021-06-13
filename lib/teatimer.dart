import 'dart:async';
import 'package:flutter/material.dart';

class TeaTimer extends StatefulWidget {
  @override 
  _TeaTimerState createState() => _TeaTimerState();
}

class _TeaTimerState extends State<TeaTimer>{
  
  Timer? _timer;
  Duration _currentDuration = Duration();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: timerText(context),
          ),
        ElevatedButton(
          child: Text("Start"),
          onPressed: () => onButtonPress(), 
        ),
      ],
    );
  }

  //Displays the formatted text for the timer duration
  Widget timerText(BuildContext context){
    return Text("${_currentDuration.inMinutes}".padLeft(2,"0") + ":" + "${_currentDuration.inSeconds % Duration.secondsPerMinute}".padLeft(2,"0"));
  }

  //Creates a new periodic timer
  void startTimer()
  {
    _timer = Timer.periodic(Duration(seconds: 1), (_timer) { incrementSeconds(); });
  }

  //Stops the timer currently running
  void stopTimer()
  {
    _timer?.cancel();
  }

  //Whoops, I made a stopwatch
  void incrementSeconds()
  {
    setState(() {
      _currentDuration += Duration(seconds: 1);
    });
  }

  //Decrements the time display
  void decrementSeconds()
  {
    _currentDuration -= Duration(seconds: 1);
  }

  //Clears any currently running timers and creates new timer
  void onButtonPress(){

    if (_timer != null && _timer!.isActive)
    {
      stopTimer();
    }
    else{
      setState(() {
        _currentDuration = Duration.zero;
        startTimer();
      });
    }
  }
}

 