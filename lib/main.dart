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
      debugShowCheckedModeBanner: false,
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
      body: SafeArea(
        child: TeaTimer(),
      ),
    );
  }
}


// Widget teaPotButton(BuildContext context)
// {
//   return Container(
//     child: ElevatedButton.icon(
//     icon: CustomPaint(
//       painter: CustomPainter(

//       ),
//     ), 
//     label: Text("Teapot"),
//     //style: ButtonStyle(),
//     onPressed: (){ print("This button works"); }, 
//     )
//   );
// }


