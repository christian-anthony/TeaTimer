import 'package:flutter/material.dart';

class TeaPotButton extends StatefulWidget {
  const TeaPotButton({ Key? key, this.onPressed, Duration displayedTime = Duration.zero}) : super(key: key);

  final Widget? onPressed;

  @override
  _TeaPotButtonState createState() => _TeaPotButtonState();
}

class _TeaPotButtonState extends State<TeaPotButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}