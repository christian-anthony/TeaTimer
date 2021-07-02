import 'package:flutter/cupertino.dart';

class SteepCounter extends StatefulWidget {
  const SteepCounter({ Key? key }) : super(key: key);


  @override
  _SteepCounterState createState() => _SteepCounterState();
}

class _SteepCounterState extends State<SteepCounter> {

  static int _steepCount = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(
          "Steep $_steepCount",
          style: TextStyle(
            fontSize: 30,
          ),
        )
      ),
      onTap: (){
        if (_steepCount > 0){
          setState(() {
            _steepCount -= 1;
          });
        }
      },
      onLongPress: (){
        setState(() {
          _steepCount = 0;
        });
      },
    );
  }


  static void incrementCount(){
    _steepCount += 1;
  }





}