import 'package:flutter/material.dart';
import 'dart:async';
//import 'timerdisplay.dart';


//apparently my contributions dont count if they arent on the master so im adding this comment.
class TeaTimer extends StatefulWidget {
  @override 
  _TeaTimerState createState() => _TeaTimerState();
}

class _TeaTimerState extends State<TeaTimer>{


  


  Timer _timer = Timer.periodic(Duration(seconds: 1), (timer) {})..cancel();

  Duration _currentDuration = Duration();
  Duration _fullDuration = Duration();
  bool _isRunning = false;
  bool _isComplete = false; //I promise This will get used
  //double _sliderValueInSeconds = 0;
  int _steepCount = 0;




  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Stack(
            alignment: Alignment.center,
            children: [
              teaPotImage(),
              timerDisplay(),
            ],
          ),
        teaTimerSlider(context),
      ],
    );
  }

  Widget timerDisplay(){
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
  

    double sliderValue = 0;
    //String sliderLabel= "";

  //Slider widget for choosing timer duration
  Widget teaTimerSlider(BuildContext context)
  {

    return Slider(
      value: sliderValue, 
      onChanged: (double value){
        setState(() {
          sliderValue = value;
        });
      },
      min: 0,
      max: 300,
      label: sliderLabelText(),
      divisions: 300,
      );
  }

  
  String sliderLabelText(){
    String tempString = "";
    if (sliderValue >= 60)
    {
      tempString += "${sliderValue ~/ Duration.secondsPerMinute} min ";
    }
    tempString += "${sliderValue % Duration.secondsPerMinute} sec";
    return tempString;
  }









  // //Called on timer completion, plays sound
  // void soundAlarm(){}






  Widget teaPotImage()
  {
    return Image(image: AssetImage('assets/teapot1.png'),
      height: 250,
    );
  }


//Creates a new periodic timer. 
  void startTimer()
  {

    _timer = Timer.periodic(Duration(seconds: 1), (timer) { onTick(); });
    setState(() {
          _fullDuration += Duration(seconds: sliderValue.toInt());
    _currentDuration = _fullDuration;
    //Timer.run(() => onTick());
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


  //Decrements the time display
  void decrementSeconds()
  {
    setState(() 
    {
      _currentDuration -= Duration(seconds: 1); 
    });
  }

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








} //End of TeaTimer

 