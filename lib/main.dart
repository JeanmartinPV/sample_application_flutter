import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample_jpv/src/UI/ui_Home.dart';
import 'package:flutter_sample_jpv/src/Widgets/CardButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sample JPV',
      home: MyHomePage(title: 'Flutter Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 onCardTap(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:ListView(
        padding: EdgeInsets.all(15.0),
        children: [
           CardButtom(
            title: 'UI Flutter',
            description: 'Design in Flutter',
            actionTap: () {
                onCardTap(UiFlutter ());
              },
            url: 'assets/images/flutter_day.jpg',
          )
        ],
      )
    );
  }
}
