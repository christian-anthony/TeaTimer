import 'dart:async';
import 'package:flutter/material.dart';

class TimerDisplay extends StatefulWidget {
  TimerDisplay({ Key? key}) : super(key: key);



  @override
  _TimerDisplayState createState() => _TimerDisplayState();
}

class _TimerDisplayState extends State<TimerDisplay> {


  Timer _timer = Timer.periodic(Duration(seconds: 1), (timer) {})..cancel();

  Duration _currentDuration = Duration();
  Duration _fullDuration = Duration();
  bool _isRunning = false;
  bool _isComplete = false; //I promise This will get used
  //double _sliderValueInSeconds = 0;
  int _steepCount = 0;


  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector( 
      child: Column(
      children: [
        steepText(),
        timerText(_currentDuration),
      ],),
      onTap: () => onClick(),
    );
  }



//Creates a new periodic timer. 
  void startTimer()
  {

    //_timer = Timer.periodic(Duration(seconds: 1), (timer) { onTick(); });
    _currentDuration = _fullDuration;
    Timer.run(() => onTick());
    _isRunning = true;
    _isComplete = false;

  }




  void setFullDuration(Duration timeValue){
    _fullDuration = timeValue;
  }

  void addDuration(Duration timeValue){
    _fullDuration += timeValue;
  }





  //Stops the timer currently running
  void stopTimer()
  {
    _timer.cancel();
    _isRunning = false;
  }

  //Clears the duration values held by the timer. Currently set to clear on long press of the gesture widget
  void clearTimer(){
    setState(() {
      stopTimer();
      _currentDuration = Duration.zero;
      _fullDuration = Duration.zero;
    });
  }

  //Logic for the timer to call every tick
  void onTick()
  {
    if (_currentDuration == Duration.zero)
    {
      stopTimer();
      // soundAlarm();
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
  void onClick()
  {
    if (_isRunning){
      stopTimer();
    }
    else{
      setState(() {
        _steepCount++;
        startTimer();             ////THE PROBLEM IS RIGHT HERE
      });
    }
  }

  onComplete(){
    stopTimer();
    _isComplete = true;
    //soundAlarm()
  }

  //Displays the formatted text for the timer duration
  Widget timerText(Duration timeValue){
    return Text("${timeValue.inMinutes}".padLeft(2,"0") + ":" + "${timeValue.inSeconds % Duration.secondsPerMinute}".padLeft(2,"0"),
    style: TextStyle(
      fontSize: 80,
    ),);
  }

  Widget steepText(){
    return Text(
      "Steep $_steepCount",
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }





}