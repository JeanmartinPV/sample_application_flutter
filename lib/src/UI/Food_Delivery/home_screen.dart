import 'package:flutter/material.dart';
import 'package:flutter_sample_jpv/src/UI/Food_Delivery/data/data.dart';
import 'package:flutter_sample_jpv/src/UI/Food_Delivery/details_page_food.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffSet = 0;
  double yOffSet = 0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffSet, yOffSet, 0)
        ..scale(isDrawerOpen ? 0.90 : 1.00),
      duration: const Duration(milliseconds: 300),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isDrawerOpen ? BorderRadius.circular(30) : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
              child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 27,
                      ),
                      onPressed: () {
                        setState(() {
                          xOffSet = !isDrawerOpen
                              ? MediaQuery.of(context).size.width / 2
                              : 0;
                          yOffSet = !isDrawerOpen ? 40 : 0;
                          isDrawerOpen = !isDrawerOpen;
                        });
                        print('Menu');
                      }),
                  Text(
                    'FOOD DELIVERY APP',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xffFF9900),
                        fontWeight: FontWeight.w900),
                  ),
                  CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage('assets/images/jpv.jpg'))
                ],
              ),
            ),   
           
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              padding: EdgeInsets.symmetric(vertical: 7.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffF6F6F6),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xff737373),
                    size: 25,
                  ),
                  Text(
                    'Ubicación',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:15, left: 15, bottom: 10),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hola, Jeanmartin',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff585858),
                        fontWeight: FontWeight.w500),
                  ),
                  Text('Buenos días!',
                      style: TextStyle(
                          fontSize: 32,
                          color: Color(0xff585858),
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: SizedBox.expand(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric( horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xffF6F6F6),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Color(0xff585858),
                                size: 30,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'Qué estas buscando?',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox.expand(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xffF6F6F6),
                          ),
                          child: Icon(
                            Icons.settings,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
           
           Container(
              padding: EdgeInsets.only(left: 15, top: 10),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categorías',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff585858),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < listaCategoria.length; i++) ...[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            color: i == 0 ? Color(0xffFF9900) : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 5),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ]),
                        height: 160,
                        width: 95,
                        child: Center(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 7,
                                child: ClipOval(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 8),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage(listaCategoria[i].image),
                                        ),
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                  flex: 6,
                                  child: SizedBox.expand(
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        '${listaCategoria[i].name}',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            color: i == 0
                                                ? Colors.white
                                                : Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ]
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 10),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Más Populares',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff585858),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Expanded(
              child: 
              ListView.builder(
                padding: EdgeInsets.all(20),
                physics: BouncingScrollPhysics(),
                itemCount: listaPopulares.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                     
                    
                      Navigator.of(context).push(
                  PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 700),
                  pageBuilder: (context,animation,__){
                    return FadeTransition(
                      opacity: animation, 
                      child: DetailsPageFood(
                                    popular: listaPopulares[index],
                                  ),
                    );
                }));


                    },
                    child: Container(
                        margin: EdgeInsets.only(bottom: 15.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 5),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ]),
                        height: 180,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Hero(
                                tag: '${listaPopulares[index].name}',
                                child: Container(
                                  key: UniqueKey(),
                                  height: double.infinity,
                                  margin: EdgeInsets.only(right: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                  ),
                                  child: Image(
                                    image:
                                        AssetImage(listaPopulares[index].image),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${listaPopulares[index].name}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20.0)),
                                    Text('${listaPopulares[index].category}',
                                        style: TextStyle(
                                          color: Color(0xff8D8D8D),
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18.0)),
                                            SizedBox(height: 15,),
                                    Row(
                                      children: [
                                        Text('${listaPopulares[index].price1}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20.0,
                                                
                                           
                                            )),
                                            SizedBox(width: 5,),
                                        Text('${listaPopulares[index].price2}',
                                        style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20.0,
                                                 color: Color(0xff8D8D8D),
                                           
                                            )
                                        )
                                      ],
                                    )
                                    ,Spacer()
                                     ,Container(
                                       alignment: Alignment.bottomRight,
                                       width: double.infinity,
                                         child:   
                                            Icon(
                                                Icons.favorite_sharp,
                                                color: Color(0xffFF9900),
                                                size: 35,
                                              )
                                            
                                       )
                                     
                                  ],
                                ),
                              ),
                            ), 
                          ],
                        )),
                  );
                },
              ),
           
            ),
          ],
        ),
      ),
    );
  }
}
