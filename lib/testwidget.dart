
import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({ Key? key }) : super(key: key);

  





  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: Column(
      children: [
        Text("$count",
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold)
        ),
        ElevatedButton(onPressed: incrementCount, child: Text("Add"))
      ]
    )
    );
  }

  void incrementCount(){
    setState(() {
      count = count + 1;
    });
    
  }
}