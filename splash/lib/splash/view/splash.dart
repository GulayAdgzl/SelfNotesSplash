import 'package:flutter/material.dart';
import 'package:splash/splash/view/splash_view.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {},
      ),
      body: Column(children: [
        Spacer(flex: 2),
        Expanded(
          flex: 4,
          child: Splash(
            path: 'note',
          ),
        )
      ]),
    );
  }
}
