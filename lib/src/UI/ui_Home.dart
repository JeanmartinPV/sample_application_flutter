
import 'package:flutter/material.dart';
import 'package:flutter_sample_jpv/src/UI/Person_Search/home_page_person_search.dart';
import 'package:flutter_sample_jpv/src/UI/Person_Search/init.dart';
import 'package:flutter_sample_jpv/src/Widgets/CardButton.dart';

class UiFlutter extends StatefulWidget {
  UiFlutter({Key? key}) : super(key: key);

  @override
  _UiFlutterState createState() => _UiFlutterState();
}

class _UiFlutterState extends State<UiFlutter> {

   onCardTap(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('UI in flutter')
      ),
     body : ListView(
        padding: EdgeInsets.all(15.0),
        children: [
          CardButtom(
            title: 'Person Search',
            description: 'Search for records in reniec',
            actionTap: () {
                onCardTap(InitPersonSearch());
              },
            url: 'assets/person_search/machu_picchu.png',
          ),
        ],
      )
    );
  }
}