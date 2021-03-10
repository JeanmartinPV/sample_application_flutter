import 'package:flutter/material.dart';
import 'package:flutter_sample_jpv/src/UI/Person_Search/home_page_person_search.dart';
import 'package:flutter_sample_jpv/src/UI/Person_Search/services/services.dart';
import 'package:provider/provider.dart';


class InitPersonSearch extends StatefulWidget {
  InitPersonSearch({Key? key}) : super(key: key);

  @override
  _InitPersonSearchState createState() => _InitPersonSearchState();
}

class _InitPersonSearchState extends State<InitPersonSearch> {
  @override
  Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> Services())
        ],
        child: MaterialApp(
          
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light( 
              ).copyWith(
                accentColor: Color(0xff00111C)
              ),
              home: HomePersonSearch(),
        ),
      );
  }
}