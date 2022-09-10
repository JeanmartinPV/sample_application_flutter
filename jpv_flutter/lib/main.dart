import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jpv_flutter/src/Widgets/CardButton.dart';
import 'package:jpv_flutter/src/ui/ui_Home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sample JPV',
      home: MyHomePage(title: 'Flutter Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  onCardTap(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          CardButtom(
            title: 'UI Flutter',
            description: 'Design in Flutter',
            actionTap: () {
              onCardTap(const UiFlutter());
            },
            url: 'assets/images/flutter_day.jpg',
          )
        ],
      ),
    );
  }
}
