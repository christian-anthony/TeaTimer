import 'package:flutter/material.dart';
import 'teatimer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[800]
      ),
      home: MyHomePage(title: 'Tea Timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        ),
      body: Center(
        child: teaPotButton(context),
      ),
    );
  }
}




Widget teaPotButton(BuildContext context)
{
  return Container(
    child: ElevatedButton.icon(
    icon: teaPotImage(context), 
    label: Text("Teapot"),
    //style: ButtonStyle(),
    onPressed: (){ print("This button works"); }, 
    )
  );
}




class teaPotPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }



  
}







Widget teaPotImage(BuildContext context)
{
return Image(image: AssetImage('assets/teapot1.png'),
    height: 250,
  );
}