import 'dart:async';
import 'package:flutter/material.dart';


//apparently my contributions dont count if they arent on the master so im adding this comment.
class TeaTimer extends StatefulWidget {
  @override 
  _TeaTimerState createState() => _TeaTimerState();
}

class _TeaTimerState extends State<TeaTimer>{
  
  Timer? _timer;
  Duration _currentDuration = Duration();
  bool isRunning = false;
  double _sliderValueInSeconds = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: null,
      alignment: Alignment.center,
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          timerText(context, _currentDuration),
          ElevatedButton(
            child: Text("Start"),
            onPressed: () => onButtonPress(), 
          ),
          teaTimerSlider(context),
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
    _currentDuration = Duration(seconds: _sliderValueInSeconds.toInt());   //This is a temp hardcoded value for testing
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
        startTimer();
      });
    }
  }

  //Displays the formatted text for the timer duration
  Widget timerText(BuildContext context, Duration timeValue){
    return Text(timerTextString(timeValue),
    style: TextStyle(
      fontSize: 80,
    ),);
  }

  //Outputs string from duration with 00:00 format
  String timerTextString(Duration timeValue){
    return "${timeValue.inMinutes}".padLeft(2,"0") + ":" + "${timeValue.inSeconds % Duration.secondsPerMinute}".padLeft(2,"0");
  }

  //Outputs string from duration with 00 min 00 sec format
  String timerTextStringWritten(Duration timeValue){
    return "${timeValue.inMinutes} min" + " " + "${timeValue.inSeconds % Duration.secondsPerMinute} sec";
  }

  //Slider widget for choosing timer duration
  Widget teaTimerSlider(BuildContext context)
  {
    return Slider(
      value: _sliderValueInSeconds, 
      onChanged: (double value){
        setState(() {
          _sliderValueInSeconds = value;
        });
      },
      min: 0,
      max: 300,
      label: timerTextStringWritten(Duration(seconds:_sliderValueInSeconds.toInt())),
      divisions: 300,
      );
  }

  //Called on timer completion, plays sound
  void soundAlarm(){}

} //End of TeaTimer

 