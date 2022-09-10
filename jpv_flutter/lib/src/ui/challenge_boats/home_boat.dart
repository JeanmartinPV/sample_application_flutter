import 'package:flutter/material.dart';
import 'package:jpv_flutter/src/ui/challenge_boats/data.dart';

class HomeBoatChallenge extends StatefulWidget {
  HomeBoatChallenge({Key? key}) : super(key: key);

  @override
  _HomeBoatChallengeState createState() => _HomeBoatChallengeState();
}

class _HomeBoatChallengeState extends State<HomeBoatChallenge>
    with SingleTickerProviderStateMixin {
  PageController controllerPage = PageController();

  late AnimationController animationController;

  double _current = 0.0;

  bool _active = false;
  bool _isDark = false;

  void _listener() {
    setState(() {
      _current = controllerPage.page!;
    });
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    controllerPage.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    controllerPage.removeListener(_listener);
    controllerPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: !_active
            ? AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Text(
                  'Boats',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _isDark ? Colors.white : Colors.black,
                      fontSize: 30),
                ),
                actions: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: _isDark ? Colors.white : Colors.black,
                            size: 35,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.nights_stay_sharp,
                                color:
                                    _isDark ? Color(0xff63FFDA) : Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isDark = !_isDark;
                                });
                              }),
                        ],
                      ))
                ],
              )
            : null,
        body: Container(
            child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight,
            ),
            Expanded(
              flex: 4,
              child: PageView.builder(
                clipBehavior: Clip.none,
                physics: _active
                    ? const NeverScrollableScrollPhysics()
                    : const BouncingScrollPhysics(),
                controller: controllerPage,
                itemCount: Boat.listBoat.length,
                itemBuilder: (context, index) {
                  final value = (_current - index).abs();
                  final opacity = 1 - value.clamp(0, 1);
                  final scale = 1 - value.clamp(0, 0.2);

                  final boat = Boat.listBoat[index];
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Container(
                              clipBehavior: Clip.none,
                              child: AnimatedBuilder(
                                  animation: animationController,
                                  builder: (context, snapshot) {
                                    final valueAnimation = Curves.easeIn
                                        .transform(animationController.value);
                                    return Opacity(
                                      opacity: opacity.toDouble(),
                                      child: Container(
                                        child: Transform(
                                            alignment: scale < 1
                                                ? Alignment.center
                                                : Alignment.topRight,
                                            transform: Matrix4.identity()
                                              ..scale(scale)
                                              ..rotateZ(
                                                (-1.55 * valueAnimation)
                                                    .toDouble(),
                                              )
                                              ..leftTranslate(
                                                (-(size.width * 0.8) *
                                                        valueAnimation)
                                                    .toDouble(),
                                              ),
                                            child: _ImageBoat(
                                                boat: boat,
                                                isDark: _isDark,
                                                size: size)),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          if (_active != true) _TextHome(boat: boat)
                        ],
                      ),
                      if (_active) ...[
                        Positioned(
                            left: 15,
                            top: 0,
                            child: FloatingActionButton(
                                elevation: 0.0,
                                mini: true,
                                backgroundColor: _isDark
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.2),
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {});
                                  _active = false;
                                  animationController.reverse();
                                })),
                        Positioned(
                            top: size.height * 0.22,
                            left: 0,
                            right: 0,
                            height: size.height * 0.78,
                            child: _PageDetails(boat: boat))
                      ]
                    ],
                  );
                },
              ),
            ),
            if (_active != true)
              ButtonNextPage(
                isDark: _isDark,
                animationController: animationController,
                ontap: () {
                  animationController.forward();
                  setState(() {
                    _active = true;
                  });
                },
              )
          ],
        )),
      ),
    );
  }
}

class _ImageBoat extends StatelessWidget {
  const _ImageBoat({
    Key? key,
    required this.boat,
    required bool isDark,
    required this.size,
  })  : _isDark = isDark,
        super(key: key);

  final Boat boat;
  final bool _isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
            child: Image.asset(
              boat.image,
              color: _isDark ? Colors.white : Colors.black,
              width: size.width * 0.415,
            ),
            opacity: 0.5),
        Image.asset(
          boat.image,
          width: size.width * 0.4,
        ),
      ],
    );
  }
}

class ButtonNextPage extends StatelessWidget {
  const ButtonNextPage({
    Key? key,
    required bool isDark,
    required this.animationController,
    required this.ontap,
  })  : _isDark = isDark,
        super(key: key);

  final bool _isDark;
  final AnimationController animationController;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Center(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0),
          child: Text(
            'SPEC >',
            style: TextStyle(
              color: _isDark ? Color(0xff63FFDA) : Colors.blue,
              fontSize: 20,
            ),
          ),
          onPressed: ontap,
        )),
      ),
    );
  }
}

class _PageDetails extends StatelessWidget {
  const _PageDetails({
    Key? key,
    required this.boat,
  }) : super(key: key);

  final Boat boat;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        boat.title,
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        boat.subTitle,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                TweenAnimationBuilder(
                    tween: Tween(begin: 1.0, end: 0.0),
                    curve: Curves.elasticOut,
                    duration: const Duration(milliseconds: 1000),
                    builder: (context, double valorTween, widget) {
                      return Transform.translate(
                        offset: Offset(0.0, 50 * valorTween),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Meet the highest performing inboard \nwaterski boat ever created.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'SPEC',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Column(
                                    children: [
                                      FeatureBoat(
                                        type: 'Boat Lenaght',
                                        fact: "24'2'",
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      FeatureBoat(
                                        type: 'Beam',
                                        fact: "102'",
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      FeatureBoat(
                                        type: 'Weight',
                                        fact: "2767 KG",
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      FeatureBoat(
                                        type: 'Fuel capacity',
                                        fact: "322 L",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    'GALERRY',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  3,
                                  (index) => Container(
                                    margin: EdgeInsets.all(10),
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/boats/img${index + 1}.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureBoat extends StatelessWidget {
  const FeatureBoat({
    Key? key,
    required this.type,
    required this.fact,
  }) : super(key: key);
  final String type;
  final String fact;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                child: Text(
          type,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ))),
        Expanded(
            child: Container(
                child: Text(
          fact,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22),
        ))),
      ],
    );
  }
}

class _TextHome extends StatelessWidget {
  const _TextHome({
    Key? key,
    required this.boat,
  }) : super(key: key);

  final Boat boat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            boat.title,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          boat.subTitle,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
