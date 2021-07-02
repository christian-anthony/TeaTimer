import 'package:flutter/material.dart';
import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'steepcounter.dart';
//import 'timerdisplay.dart';


//apparently my contributions dont count if they arent on the master so im adding this comment.
class TeaTimer extends StatefulWidget {
  @override 
  _TeaTimerState createState() => _TeaTimerState();
}

class _TeaTimerState extends State<TeaTimer>{

  AudioPlayer chime = AudioPlayer();
  
  Timer _timer = Timer.periodic(Duration(seconds: 1), (timer) {})..cancel();
  Duration _currentDuration = Duration();
  Duration _fullDuration = Duration();
  double sliderValue = 0;
  bool _isRunning = false;
  bool _isComplete = false; //I promise This will get used
  int _steepCount = 0;

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //         Stack(
  //           alignment: Alignment.center,
  //           children: [
  //             teaPotImage(),
  //             GestureDetector( 
  //               child: Column(
  //                 children: [
  //                   steepText(),
  //                   timerText(_currentDuration),
  //                 ],
  //               ),
  //               onTap: () => onClick(),
  //               onLongPress: () => clearTimer(),
  //             ),
  //           ],
  //         ),
  //       teaTimerSlider(context),
  //       ElevatedButton(onPressed: () => playSound(), child: Text("Play Sound")),
  //     ],
  //   );
  // }
  




  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Stack(
            alignment: Alignment.center,
            children: [
              teaPotImage(),
              SteepCounter(),
              // GestureDetector( 
              //   child: Column(
              //     children: [
              //       steepText(),
              //       timerText(_currentDuration),
              //     ],
              //   ),
              //   onTap: () => onClick(),
              //   onLongPress: () => clearTimer(),
              // ),
            ],
          ),
        teaTimerSlider(context),
        ElevatedButton(onPressed: () => playSound(), child: Text("Play Sound")),
      ],
    );
  }















  //Creates a new periodic timer. 
  void startTimer()
  {
    setState(() {
      _fullDuration += Duration(seconds: sliderValue.toInt());
      _currentDuration = _fullDuration;
      _timer = Timer.periodic(Duration(seconds: 1), (timer){  onTick(); });
      //Timer.run(() => onTick());
      _isRunning = true;
      _isComplete = false;
    });
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

  //Timer calls this after each duration
  void onTick()
  {

    //**This is a bandaid for the delay bug**
    if (_currentDuration.inSeconds == 1)
    { 
      playSound();
    }
    //************************************** */
  
    if (_currentDuration.inSeconds == 0)
    { 
      //playSound();
      stopTimer();
    }
    else
    {
      setState(() {
        _currentDuration -= Duration(seconds: 1);
      });
    }
  }
  
  //Defines what happens when gesture detector is tapped
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

  //WIP is called at the end of the timer
  void onComplete() {
    stopTimer();
    _isComplete = true;
    playSound();
  }

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
      max: 120,
      label: sliderLabelText(),
      divisions: 120,
      );
  }

  //Formats the label for the slider
  String sliderLabelText(){
    String tempString = "";
    if (sliderValue >= 60)
    {
      tempString += "${sliderValue ~/ Duration.secondsPerMinute} min ";
    }
    tempString += "${(sliderValue % Duration.secondsPerMinute).toInt()} sec";
    return tempString;
  }

  //Displays the formatted text for the timer duration
  Widget timerText(Duration timeValue){
    return Text("${timeValue.inMinutes}".padLeft(2,"0") + ":" + "${timeValue.inSeconds % Duration.secondsPerMinute}".padLeft(2,"0"),
    style: TextStyle(
      fontSize: 80,
    ),);
  }

  //Displays the steep text above the timer
  Widget steepText(){
    return Text(
      "Steep $_steepCount",
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }

  //Returns formatted tea pot image
  Widget teaPotImage()
  {
    return Image(image: AssetImage('assets/teapot1.png'),
      height: 250,
    );
  }

  void playSound(){
  
    chime.setAsset('assets/collect-2.wav');
    chime.play();
    //chime.play();
  }

} //End of TeaTimer

 
//  Commented out for future use

// Decrements the time display
// void decrementSeconds(){}

// void setFullDuration(Duration timeValue){
//   _fullDuration = timeValue;
// }

// void addDuration(Duration timeValue){
//   _fullDuration += timeValue;
// }