import 'package:flutter/material.dart';

class DrawerDelivery extends StatefulWidget {
  DrawerDelivery({Key? key}) : super(key: key);

  @override
  _DrawerDeliveryState createState() => _DrawerDeliveryState();
}

class _DrawerDeliveryState extends State<DrawerDelivery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                 CircleAvatar(
                    radius: 27,
                    backgroundImage: AssetImage('assets/images/jpv.jpg')),
              SizedBox(width: 10,),
                 Text(
                  'Hola,\nJeanmartin',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
               
              ],
            ),
          ),  
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15, left: 10),
            child: Column(
              children: [
                Row(
                  children: [
                      Icon(Icons.home, size: 35,),
                      SizedBox(width: 5,),
                      Text('Inicio', style: TextStyle(fontSize: 25),)
                ],),
                SizedBox(height: 28,),
                Row(
                  children: [
                      Icon(Icons.shopping_cart_rounded, size: 35,),
                      SizedBox(width: 5,),
                      Text('Mi Carrito', style: TextStyle(fontSize: 25),)
                ],), 
                SizedBox(height: 28,),
                Row(
                  children: [
                      Icon(Icons.app_registration, size: 35,),
                      SizedBox(width: 5,),
                      Text('Ordenes', style: TextStyle(fontSize: 25),)
                ],),
                SizedBox(height: 28,),
                Row(
                  children: [
                      Icon(Icons.favorite, size: 35,),
                      SizedBox(width: 5,),
                      Text('Favoritos', style: TextStyle(fontSize: 25),)
                ],),
                SizedBox(height: 28,),
                 Row(
                  children: [
                      Icon(Icons.credit_card_rounded, size: 35,),
                      SizedBox(width: 5,),
                      Text('Pagos', style: TextStyle(fontSize: 25),)
                ],),
                SizedBox(height: 28,),
                 Row(
                  children: [
                      Icon(Icons.exit_to_app, size: 35,),
                      SizedBox(width: 5,),
                      Text('Salir', style: TextStyle(fontSize: 25),)
                ],),
              ],
            ),
          ) 
         
        ],
      ),
    );
  }
}