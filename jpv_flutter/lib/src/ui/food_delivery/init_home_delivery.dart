import 'package:flutter/material.dart';
import 'package:jpv_flutter/src/ui/food_delivery/drawer_delivery.dart';
import 'package:jpv_flutter/src/ui/food_delivery/home_screen.dart';

class InitHomeDelivery extends StatefulWidget {
  const InitHomeDelivery({Key? key}) : super(key: key);

  @override
  State<InitHomeDelivery> createState() => _InitHomeDeliveryState();
}

class _InitHomeDeliveryState extends State<InitHomeDelivery> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeDelivery(),
    );
  }
}

class HomeDelivery extends StatelessWidget {
  const HomeDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DrawerDelivery(), const HomeScreen()],
      ),
    );
  }
}
