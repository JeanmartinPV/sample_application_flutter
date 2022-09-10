import 'package:flutter/material.dart';
import 'package:jpv_flutter/src/Widgets/CardButton.dart';
import 'package:jpv_flutter/src/ui/challenge_boats/home_boat.dart';
import 'package:jpv_flutter/src/ui/food_delivery/init_home_delivery.dart';
import 'package:jpv_flutter/src/ui/nike_shoes/pages/home_page.dart';
import 'package:jpv_flutter/src/ui/person_search/init.dart';
import 'package:jpv_flutter/src/ui/sliver_card_animation/home_challenge_sliver.dart';
import 'package:jpv_flutter/src/ui/sliver_with_tab/home_sliver_with_scrollable_tabs.dart';

class UiFlutter extends StatefulWidget {
  const UiFlutter({Key? key}) : super(key: key);

  @override
  State<UiFlutter> createState() => _UiFlutterState();
}

class _UiFlutterState extends State<UiFlutter> {
  onCardTap(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('UI in flutter')),
        body: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            CardButtom(
              title: 'Person Search',
              description: 'Search for records in reniec',
              actionTap: () {
                onCardTap(const InitPersonSearch());
              },
              url: 'assets/person_search/machu_picchu.png',
            ),
            CardButtom(
              title: 'Food Delivery',
              description: 'Search for records in reniec',
              actionTap: () {
                onCardTap(const InitHomeDelivery());
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
                onCardTap(const HomeSliverChallenge());
              },
              url: 'assets/sliver/sliver_challenge.jpg',
            ),
            CardButtom(
              title: 'Nikes Shoes',
              description: 'Shoes list animation',
              actionTap: () {
                onCardTap(const HomePageShoes());
              },
              url: 'assets/shoes/background_shoes.png',
            ),
            CardButtom(
              title: 'Sliver Animations',
              description: 'Sliver Animations with scrollable tabs',
              actionTap: () {
                onCardTap(const HomeSliverWithTab());
              },
              url: 'assets/sliver_with_scrollable_tabs/poster_challenge.jpg',
            ),
          ],
        ));
  }
}
