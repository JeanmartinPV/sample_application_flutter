import 'package:flutter/material.dart';
import 'package:flutter_sample_jpv/src/UI/Food_Delivery/init_home_delivery.dart';
import 'package:flutter_sample_jpv/src/UI/Person_Search/init.dart';
import 'package:flutter_sample_jpv/src/UI/Sliver_Card_Animation/home_challenge_sliver.dart';
import 'package:flutter_sample_jpv/src/UI/challenge_boats/home_boat.dart';
import 'package:flutter_sample_jpv/src/UI/nike_shoes/pages/home_page.dart';
import 'package:flutter_sample_jpv/src/UI/sliver_with_tab/home_sliver_with_scrollable_tabs.dart';
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
        appBar: AppBar(title: Text('UI in flutter')),
        body: ListView(
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
            CardButtom(
              title: 'Food Delivery',
              description: 'Search for records in reniec',
              actionTap: () {
                onCardTap(InitHomeDelivery());
              },
              url: 'assets/food_delivery/background_delivery.png',
            ),
            CardButtom(
              title: 'List Boats',
              description: 'Animated Ship List',
              actionTap: () {
                onCardTap(HomeBoatChallenge());
              },
              url: 'assets/boats/boats.png',
            ),
            CardButtom(
              title: 'Sliver Challenge',
              description: 'Sliver Card Animation',
              actionTap: () {
                onCardTap(HomeSliverChallenge());
              },
              url: 'assets/sliver/sliver_challenge.jpg',
            ),
            CardButtom(
              title: 'Nikes Shoes',
              description: 'Shoes list animation',
              actionTap: () {
                onCardTap(HomePageShoes());
              },
              url: 'assets/shoes/background_shoes.png',
            ),
            CardButtom(
              title: 'Sliver Animations',
              description: 'Sliver Animations with scrollable tabs',
              actionTap: () {
                onCardTap(HomeSliverWithTab());
              },
              url: 'assets/sliver_with_scrollable_tabs/poster_challenge.jpg',
            ),
          ],
        ));
  }
}
