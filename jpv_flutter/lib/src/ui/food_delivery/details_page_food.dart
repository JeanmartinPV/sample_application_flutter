import 'package:flutter/material.dart';
import 'package:jpv_flutter/src/ui/food_delivery/data/data_food.dart';

class DetailsPageFood extends StatelessWidget {
  const DetailsPageFood({Key? key, required this.popular}) : super(key: key);

  final Populares popular;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BackButton(),
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
            Stack(
              children: [
                Hero(
                    tag: popular.name,
                    child: Image(
                      image: AssetImage(popular.image),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                    )),
                const Positioned(
                    left: 20,
                    top: 0,
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: Color(0xffFF9900),
                    )),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: Container(
                    clipBehavior: Clip.none,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShakeTransition(
                          fade: true,
                          axis: Axis.vertical,
                          duration: const Duration(milliseconds: 1000),
                          child: Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: const SizeFood(
                                size: 'S',
                              )),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const ShakeTransition(
                          fade: true,
                          axis: Axis.vertical,
                          duration: Duration(milliseconds: 1200),
                          child: SizeFood(
                            size: 'M',
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ShakeTransition(
                          fade: true,
                          axis: Axis.vertical,
                          duration: const Duration(milliseconds: 1000),
                          child: Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: const SizeFood(
                                size: 'L',
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(popular.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 22.0)),
                        Text(popular.category,
                            style: const TextStyle(
                                color: Color(0xff8D8D8D),
                                fontWeight: FontWeight.w800,
                                fontSize: 20.0)),
                      ],
                    ),
                    const Spacer(),
                    Text(popular.price1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 35.0,
                        )),
                  ],
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'Cantidad',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8D8D8D),
                          fontSize: 22.0),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: SizedBox.expand(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xffF6F6F6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.remove,
                              size: 20,
                            ),
                            Text(
                              '5',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ShakeTransition(
                axis: Axis.vertical,
                child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                        color: Color(0xffFF9900),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 20),
                          child: Text(
                            'Restaurantes',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 30),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(20),
                            physics: const BouncingScrollPhysics(),
                            itemCount: listaRestaurant.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                    margin: const EdgeInsets.only(bottom: 15.0),
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0, 5),
                                              blurRadius: 5,
                                              spreadRadius: 2)
                                        ]),
                                    height: 160,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            height: double.infinity,
                                            margin: const EdgeInsets.only(
                                                right: 5.0),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: Colors.white,
                                            ),
                                            child: Image(
                                              image: AssetImage(
                                                  listaRestaurant[index].image),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    listaRestaurant[index].name,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 22.0)),
                                                Text(
                                                    listaRestaurant[index]
                                                        .available,
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff8D8D8D),
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 20.0)),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        listaRestaurant[index]
                                                            .price1,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 20.0,
                                                        )),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                        listaRestaurant[index]
                                                            .price2,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 20.0,
                                                          color:
                                                              Color(0xff8D8D8D),
                                                        ))
                                                  ],
                                                ),
                                                const Spacer(),
                                                Container(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    width: double.infinity,
                                                    child: index == 0
                                                        ? const Icon(
                                                            Icons
                                                                .favorite_sharp,
                                                            color: Color(
                                                                0xffFF9900),
                                                            size: 35,
                                                          )
                                                        : null)
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
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SizeFood extends StatelessWidget {
  const SizeFood({
    Key? key,
    required this.size,
  }) : super(key: key);
  final String size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 5),
                blurRadius: 5,
                spreadRadius: 2)
          ]),
      child: Center(
        child: Text(
          size,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}

class ShakeTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  final bool fade;

  const ShakeTransition({
    Key? key,
    this.duration = const Duration(milliseconds: 1000),
    required this.child,
    this.offset = 140.0,
    this.axis = Axis.horizontal,
    this.fade = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      curve: Curves.ease,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (_, dynamic value, __) {
        return Transform.translate(
            offset: axis == Axis.horizontal
                ? Offset(value * offset, 0.0)
                : Offset(0.0, value * offset),
            child: fade
                ? TweenAnimationBuilder(
                    duration: duration,
                    tween: Tween(begin: 0.0, end: 1.0),
                    builder: (_, dynamic value, __) {
                      return AnimatedOpacity(
                        opacity: value,
                        duration: const Duration(milliseconds: 500),
                        child: child,
                      );
                    },
                    child: child)
                : child);
      },
      child: child,
    );
  }
}
