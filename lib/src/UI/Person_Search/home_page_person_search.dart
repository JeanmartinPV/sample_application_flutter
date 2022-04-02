import 'package:flutter/material.dart';
import 'package:flutter_sample_jpv/src/UI/Person_Search/details_page.dart';
import 'package:flutter_sample_jpv/src/UI/Person_Search/services/services.dart';
import 'package:provider/provider.dart';

class HomePersonSearch extends StatefulWidget {
  HomePersonSearch({Key? key}) : super(key: key);

  @override
  _HomePersonSearchState createState() => _HomePersonSearchState();
}

class _HomePersonSearchState extends State<HomePersonSearch> {
  @override
  Widget build(BuildContext context) {
    final requests = Provider.of<Services>(context);
    final borderRadiusButton = BorderRadius.circular(10.0);

    return Scaffold(
      body: Stack(children: [
        Container(
            child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ShaderMask(
                shaderCallback: (rect) => LinearGradient(
                        colors: [Color(0xff001D2E), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center)
                    .createShader(rect),
                blendMode: BlendMode.darken,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/person_search/machu_picchu.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Color(0xff001D2E).withOpacity(0.3),
                              BlendMode.darken))),
                  child: Center(
                    child: Consumer<Services>(builder: (_, snapshot, __) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DNI',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2.0),
                            ),
                            Text(
                              snapshot.dni,
                              style: TextStyle(
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.w500,
                                  // color: Color(0xff001D2E)
                                  color: Color(0xff00111C)),
                            ),
                          ]);
                    }),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  color: Color(0xff001D2E),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 150,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Person Search',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 45.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2.0),
                              ),
                              Text(
                                'You can search by ID for anyone',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 420,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                children: [
                                  _Boton(
                                    requests: requests,
                                    number: '1',
                                  ),
                                  _Boton(
                                    requests: requests,
                                    number: '2',
                                  ),
                                  _Boton(
                                    requests: requests,
                                    number: '3',
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  _Boton(
                                    requests: requests,
                                    number: '4',
                                  ),
                                  _Boton(
                                    requests: requests,
                                    number: '5',
                                  ),
                                  _Boton(
                                    requests: requests,
                                    number: '6',
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  _Boton(
                                    requests: requests,
                                    number: '7',
                                  ),
                                  _Boton(
                                    requests: requests,
                                    number: '8',
                                  ),
                                  _Boton(
                                    requests: requests,
                                    number: '9',
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  _Boton(
                                    requests: requests,
                                    number: '0',
                                  ),
                                  _Boton(
                                    requests: requests,
                                    number: 'B',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 100,
                          child:
                              Column(mainAxisSize: MainAxisSize.max, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 23.0),
                              child: Material(
                                elevation: 5.0,
                                color: Color(0xffFFCD22),
                                shape: RoundedRectangleBorder(
                                    borderRadius: borderRadiusButton),
                                child: InkWell(
                                  borderRadius: borderRadiusButton,
                                  onTap: () {
                                    requests.getResult(requests.dni);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: borderRadiusButton),
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'Search',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.w500),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ]))
                    ],
                  ),
                ))
          ],
        )),
        Consumer<Services>(builder: (context, snapshot, __) {
          return _efecto(snapshot);
        })
      ]),
    );
  }

  Widget _efecto(Services requests) {
    return AnimatedPositioned(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 700),
      left: 0,
      right: 0,
      top: !requests.isLoading ? MediaQuery.of(context).size.height : 0,
      bottom: !requests.isLoading ? 50 : 0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: requests.isLoading ? 1 : 0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: !requests.isLoading
                  ? Radius.circular(0)
                  : Radius.circular(MediaQuery.of(context).size.width / 2),
              topRight: !requests.isLoading
                  ? Radius.circular(0)
                  : Radius.circular(MediaQuery.of(context).size.width / 2),
              bottomLeft: !requests.isLoading
                  ? Radius.circular(0)
                  : Radius.circular(100),
              bottomRight: !requests.isLoading
                  ? Radius.circular(0)
                  : Radius.circular(100),
            ),
            color: Color(0xffFFCD22),
          ),
          child: requests.isLoading ? DetailsPageSearch() : Container(),
        ),
      ),
    );
  }
}

class _Boton extends StatelessWidget {
  const _Boton({Key? key, required this.requests, required this.number})
      : super(key: key);

  final Services requests;
  final String number;

  @override
  Widget build(BuildContext context) {
    final borderRadiusButton = BorderRadius.circular(5.0);
    return Expanded(
      flex: this.number == 'B' ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 3.0,
          color: Color(0xff001C2B),
          shape: RoundedRectangleBorder(borderRadius: borderRadiusButton),
          child: InkWell(
            borderRadius: borderRadiusButton,
            onTap: () {
              if (this.number == 'B') {
                requests.borrar();
              } else {
                requests.dni = requests.dni + this.number;
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1.0),
                  borderRadius: borderRadiusButton),
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: this.number != 'B'
                      ? Text(
                          this.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w300),
                        )
                      : Text(
                          'Delete',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w200),
                        )),
            ),
          ),
        ),
      ),
    );
  }
}
