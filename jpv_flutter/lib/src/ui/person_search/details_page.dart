import 'package:flutter/material.dart';
import 'package:jpv_flutter/src/ui/person_search/services/services.dart';
import 'package:provider/provider.dart';

class DetailsPageSearch extends StatefulWidget {
  const DetailsPageSearch({Key? key}) : super(key: key);

  @override
  State<DetailsPageSearch> createState() => _DetailsPageSearchState();
}

class _DetailsPageSearchState extends State<DetailsPageSearch> {
  final borderRadiusButton = BorderRadius.circular(10.0);
  final style = const TextStyle(
      fontSize: 25.0,
      color: Color(0xff00111C),
      fontWeight: FontWeight.w800,
      letterSpacing: 1.0);
  final substyle = const TextStyle(
      fontSize: 30.0,
      color: Colors.white,
      fontWeight: FontWeight.w300,
      letterSpacing: 2.0);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Services>(context, listen: false).efectoCircular(false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final requests = Provider.of<Services>(context);

    return AnimatedContainer(
        duration: const Duration(milliseconds: 900),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: requests.efectocircular
                ? Radius.circular(MediaQuery.of(context).size.width / 2)
                : Radius.circular(0),
            topRight: requests.efectocircular
                ? Radius.circular(MediaQuery.of(context).size.width / 2)
                : Radius.circular(0),
            bottomLeft: requests.efectocircular
                ? Radius.circular(100)
                : Radius.circular(0),
            bottomRight: requests.efectocircular
                ? Radius.circular(100)
                : Radius.circular(0),
          ),
          color: Color(0xffFFCD22),
        ),
        height: double.infinity,
        width: double.infinity,
        child: requests.mostrar
            ? ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(50.0),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  ShakeTransition(
                    child: Icon(
                      Icons.check_circle_outline_rounded,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ShakeTransition(
                      child: Text(
                    'Successful Result',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  ShakeTransition(
                      axis: Axis.vertical,
                      child: Text(
                        'Name:',
                        style: style,
                      )),
                  ShakeTransition(
                      axis: Axis.vertical,
                      child: Text(
                        requests.persona.name ?? '',
                        style: substyle,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  ShakeTransition(
                      axis: Axis.vertical,
                      child: Text(
                        'First Name:',
                        style: style,
                      )),
                  ShakeTransition(
                      axis: Axis.vertical,
                      child: Text(
                        requests.persona.firstName ?? '',
                        style: substyle,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  ShakeTransition(
                      axis: Axis.vertical,
                      child: Text(
                        'Last Name:',
                        style: style,
                      )),
                  ShakeTransition(
                      axis: Axis.vertical,
                      child: Text(
                        requests.persona.lastName ?? '',
                        style: substyle,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  ShakeTransition(
                    axis: Axis.vertical,
                    child: Material(
                      elevation: 5.0,
                      color: Color(0xff003859),
                      shape: RoundedRectangleBorder(
                          borderRadius: borderRadiusButton),
                      child: InkWell(
                        borderRadius: borderRadiusButton,
                        onTap: () {
                          requests.isLoading = false;
                          requests.efectoCircular(true);
                          requests.dni = 'clean';
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(borderRadius: borderRadiusButton),
                          alignment: Alignment.center,
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Return',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              )));
  }
}

class ShakeTransition extends StatelessWidget {
  final Widget child;
  final Duration durations;
  final double offset;
  final Axis axis;

  const ShakeTransition({
    Key? key,
    this.durations = const Duration(milliseconds: 900),
    this.offset = 150,
    this.axis = Axis.horizontal,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: Curves.easeInOut,
      child: child,
      tween: Tween(begin: 1.0, end: 0.0),
      duration: durations,
      builder: (context, value, child) {
        return Transform.translate(
            offset: axis == Axis.horizontal
                ? Offset(value * offset, 0)
                : Offset(0, value * offset),
            child: child);
      },
    );
  }
}
