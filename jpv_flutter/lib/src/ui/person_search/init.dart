import 'package:flutter/material.dart';
import 'package:jpv_flutter/src/ui/person_search/home_page_person_search.dart';
import 'package:jpv_flutter/src/ui/person_search/services/services.dart';
import 'package:provider/provider.dart';

class InitPersonSearch extends StatefulWidget {
  const InitPersonSearch({Key? key}) : super(key: key);

  @override
  State<InitPersonSearch> createState() => _InitPersonSearchState();
}

class _InitPersonSearchState extends State<InitPersonSearch> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Services())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xff00111C))),
        home: HomePersonSearch(),
      ),
    );
  }
}
