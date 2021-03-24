import 'package:flutter/material.dart';
import 'package:flutter_sample_jpv/src/UI/Food_Delivery/drawer_delivery.dart';
import 'package:flutter_sample_jpv/src/UI/Food_Delivery/home_screen.dart';
class InitHomeDelivery extends StatefulWidget {
  InitHomeDelivery({Key? key}) : super(key: key);

  @override
  _InitHomeDeliveryState createState() => _InitHomeDeliveryState();
}

class _InitHomeDeliveryState extends State<InitHomeDelivery> {
  
  @override
  Widget build(BuildContext context) {
      return  MaterialApp(
              debugShowCheckedModeBanner: false,
              // theme: ThemeData.light( 
              // ).copyWith(
              //   accentColor: Color(0xff00111C)
              // ),
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
        children: [
          DrawerDelivery(),
          HomeScreen()
        ],
      ),
    );
  }
}