import 'package:flutter/material.dart';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ellen',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage ({super.key});

  @override
  _StreamHomePageState createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
Color bgColor = Colors.blueGrey;
late ColorStream colorStream;

void changeColor() async {
  await for (var eventColor in colorStream.getColors()) {
    setState(() {
      bgColor = eventColor;
    });
  }
}

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Stream Demo'),
      ),
      body: Container(
       decoration: BoxDecoration(color: bgColor),
      ));
  }

  // void changeColor() async {
  //   await for (var eventColor in colorStream.getColors()) {
  //     setState(() {
  //       bgColor = eventColor;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    colorStream = ColorStream();
    changeColor();
  }
}
