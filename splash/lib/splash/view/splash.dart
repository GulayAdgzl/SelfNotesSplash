import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash/splash/view/splash_view.dart';

import 'ButtonView.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /*floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {},
        ),*/
        body: Column(
      children: [
        Spacer(flex: 2),
        Expanded(
          flex: 4,
          child: Splash(
            path: 'note',
          ),
        ),
        Spacer(flex: 2),
        Expanded(flex: 4, child: ButtonView()),
      ],
    ));
  }
}
